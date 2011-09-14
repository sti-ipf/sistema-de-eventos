employees = Employee.all(:group => 'unit_name')

employees.each do |e|
  next if e.unit_name.blank?
  puts "GERANDO ARQUIVO DA UNIDADE #{e.unit_name}"
  unit_name = e.unit_name.gsub(/[^a-zA-Z0-9 ]/,"").downcase
  

  header = ['Nº da inscrição', 'Nome','Cargo', 'Período', 'Painel > Quinta-Feira', 'Painel > Sexta-Feira']
  file  = File.new("tmp/#{unit_name}.xls", "w")
  array = []
  Registration.free.all(:conditions => "e.unit_name = '#{e.unit_name}'", :joins => "INNER JOIN employees e ON e.cpf = registrations.cpf").each do |r|
    employees = Employee.all_with_cpf(r.cpf)
    roles = [] 
    work_shifts = []
    employees.each do |e|
      roles << e.role if !e.role.blank?
      work_shifts << e.work_shift if !e.work_shift.blank?
    end
    roles = roles.join(', ')
    work_shifts = work_shifts.join(', ')

    new_array = Array.new(5)
    new_array[0] = r.id
    new_array[1] = r.name
    new_array[2] = roles
    new_array[3] = work_shifts
    new_array[4] = r.return_activity(2, [2,3])
    new_array[5] = r.return_activity(3, [1])
    
    (0..5).each do |i|
      new_array[i] = "  " if new_array[i].blank?
    end
    array << new_array
  end
  if array.count == 0
    puts "NAO REGISTROS PARA A ESCOLA #{e.unit_name}" 
    system "rm tmp/#{unit_name}.xls"
    next
  end
  array << "   "
  array << "   "
  array << "   "
  array << "   "
  array << "LEGENDA - NÚMEROS DOS PAINEIS"
  array << "   "
  array << "QUINTA-FEIRA"
  array << "   "
  array << "2 – Alfabetização no Ensino Fundamental"
  array << "4 – Educação como Direito Humano"
  array << "5 – Educação, Sustentabilidade e Desenvolvimento Local"
  array << "8 – O Pensar Científico na Escola"
  array << "10 – Matemática e Currículo"
  array << "11 – Gêneros Literários e Currículo"
  array << "13 – Diversidade: Conceitos e Preconceitos"
  array << "14 – Cidadania desde a Infância"
  array << "16 – Currículos e Avaliações"
  array << "17 – Currículo e Livro Didático"
  array << "21 – Educação de Jovens e Adultos"
  array << "   "
  array << "SEXTA-FEIRA"
  array << "   "
  array << "1 – Mídia e Educação"
  array << "3 – Alfabetização na Educação Infantil"
  array << "6 – Múltiplas Linguagens na Educação"
  array << "7 – Currículo e Gestão da Aprendizagem na Escola"
  array << "9 – Currículo, História e Formação de Identidade Cultural"
  array << "12 – Práticas Pedagógicas Inclusivas"
  array << "15 – Criança e Consumo"
  array << "18 – Educação, Família e Comunidade"
  array << "19 – A Escola, a Rua e o Bairro enquanto Espaço Educativo"
  array << "20 – Educação e o Serviço Público"
  file.puts array.to_worksheet(:header => header)
  
  file.close
end

