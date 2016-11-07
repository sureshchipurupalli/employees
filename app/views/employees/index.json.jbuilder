json.array!(@employee) do |employee|
  json.extract! employee, :id, :name, :dateofbirth, :age, :designation, :mobile
  json.url employee_url(employee, format: :json)
end