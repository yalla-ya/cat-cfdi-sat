<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:cfdi="http://www.sat.gob.mx/cfd/4" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:catCFDI="http://www.sat.gob.mx/sitio_internet/cfd/catalogos" xmlns:tdCFDI="http://www.sat.gob.mx/sitio_internet/cfd/tipoDatos/tdCFDI" targetNamespace="http://www.sat.gob.mx/cfd/4" elementFormDefault="qualified" attributeFormDefault="unqualified">
	<xs:import namespace="http://www.sat.gob.mx/sitio_internet/cfd/catalogos" schemaLocation="http://www.sat.gob.mx/sitio_internet/cfd/catalogos/catCFDI.xsd"/>
	<xs:import namespace="http://www.sat.gob.mx/sitio_internet/cfd/tipoDatos/tdCFDI" schemaLocation="http://www.sat.gob.mx/sitio_internet/cfd/tipoDatos/tdCFDI/tdCFDI.xsd"/>
	<xs:element name="Comprobante">
		<xs:annotation>
			<xs:documentation>Estándar de Comprobante Fiscal Digital por Internet.</xs:documentation>
		</xs:annotation>
		<xs:complexType>
			<xs:sequence>
				<xs:element name="InformacionGlobal" minOccurs="0">
					<xs:annotation>
						<xs:documentation>Nodo condicional para precisar la información relacionada con el comprobante global.</xs:documentation>
					</xs:annotation>
					<xs:complexType>
						<xs:attribute name="Periodicidad" type="catCFDI:c_Periodicidad" use="required">
							<xs:annotation>
								<xs:documentation>Atributo requerido para expresar el período al que corresponde la información del comprobante global.</xs:documentation>
							</xs:annotation>
						</xs:attribute>
						<xs:attribute name="Meses" type="catCFDI:c_Meses" use="required">
							<xs:annotation>
								<xs:documentation>Atributo requerido para expresar el mes o los meses al que corresponde la información del comprobante global.</xs:documentation>
							</xs:annotation>
						</xs:attribute>
						<xs:attribute name="Año" use="required">
							<xs:annotation>
								<xs:documentation>Atributo requerido para expresar el año al que corresponde la información del comprobante global.</xs:documentation>
							</xs:annotation>
							<xs:simpleType>
								<xs:restriction base="xs:short">
									<xs:minInclusive value="2021"/>
									<xs:whiteSpace value="collapse"/>
								</xs:restriction>
							</xs:simpleType>
						</xs:attribute>
					</xs:complexType>
				</xs:element>
				<xs:element name="CfdiRelacionados" minOccurs="0" maxOccurs="unbounded">
					<xs:annotation>
						<xs:documentation>Nodo opcional para precisar la información de los comprobantes relacionados.</xs:documentation>
					</xs:annotation>
					<xs:complexType>
						<xs:sequence>
							<xs:element name="CfdiRelacionado" maxOccurs="unbounded">
								<xs:annotation>
									<xs:documentation>Nodo requerido para precisar la información de los comprobantes relacionados.</xs:documentation>
								</xs:annotation>
								<xs:complexType>
									<xs:attribute name="UUID" use="required">
										<xs:annotation>
											<xs:documentation>Atributo requerido para registrar el folio fiscal (UUID) de un CFDI relacionado con el presente comprobante, por ejemplo: Si el CFDI relacionado es un comprobante de traslado que sirve para registrar el movimiento de la mercancía. Si este comprobante se usa como nota de crédito o nota de débito del comprobante relacionado. Si este comprobante es una devolución sobre el comprobante relacionado. Si éste sustituye a una factura cancelada.</xs:documentation>
										</xs:annotation>
										<xs:simpleType>
											<xs:restriction base="xs:string">
												<xs:length value="36"/>
												<xs:whiteSpace value="collapse"/>
												<xs:pattern value="[a-f0-9A-F]{8}-[a-f0-9A-F]{4}-[a-f0-9A-F]{4}-[a-f0-9A-F]{4}-[a-f0-9A-F]{12}"/>
											</xs:restriction>
										</xs:simpleType>
									</xs:attribute>
								</xs:complexType>
							</xs:element>
						</xs:sequence>
						<xs:attribute name="TipoRelacion" type="catCFDI:c_TipoRelacion" use="required">
							<xs:annotation>
								<xs:documentation>Atributo requerido para indicar la clave de la relación que existe entre éste que se está generando y el o los CFDI previos.</xs:documentation>
							</xs:annotation>
						</xs:attribute>
					</xs:complexType>
				</xs:element>
				<xs:element name="Emisor">
					<xs:annotation>
						<xs:documentation>Nodo requerido para expresar la información del contribuyente emisor del comprobante.</xs:documentation>
					</xs:annotation>
					<xs:complexType>
						<xs:attribute name="Rfc" type="tdCFDI:t_RFC" use="required">
							<xs:annotation>
								<xs:documentation>Atributo requerido para registrar la Clave del Registro Federal de Contribuyentes correspondiente al contribuyente emisor del comprobante.</xs:documentation>
							</xs:annotation>
						</xs:attribute>
						<xs:attribute name="Nombre" use="required">
							<xs:annotation>
								<xs:documentation>Atributo requerido para registrar el nombre, denominación o razón social del contribuyente inscrito en el RFC, del emisor del comprobante.</xs:documentation>
							</xs:annotation>
							<xs:simpleType>
								<xs:restriction base="xs:string">
									<xs:minLength value="1"/>
									<xs:maxLength value="300"/>
									<xs:whiteSpace value="collapse"/>
									<xs:pattern value="[^|]{1,300}"/>
								</xs:restriction>
							</xs:simpleType>
						</xs:attribute>
						<xs:attribute name="RegimenFiscal" type="catCFDI:c_RegimenFiscal" use="required">
							<xs:annotation>
								<xs:documentation>Atributo requerido para incorporar la clave del régimen del contribuyente emisor al que aplicará el efecto fiscal de este comprobante.</xs:documentation>
							</xs:annotation>
						</xs:attribute>
						<xs:attribute name="FacAtrAdquirente" use="optional">
							<xs:annotation>
								<xs:documentation>Atributo condicional para expresar el número de operación proporcionado por el SAT cuando se trate de un comprobante a través de un PCECFDI o un PCGCFDISP.</xs:documentation>
							</xs:annotation>
							<xs:simpleType>
								<xs:restriction base="xs:string">
									<xs:whiteSpace value="collapse"/>
									<xs:length value="10"/>
									<xs:pattern value="[0-9]{10}"/>
								</xs:restriction>
							</xs:simpleType>
						</xs:attribute>
					</xs:complexType>
				</xs:element>
				<xs:element name="Receptor">
					<xs:annotation>
						<xs:documentation>Nodo requerido para precisar la información del contribuyente receptor del comprobante.</xs:documentation>
					</xs:annotation>
					<xs:complexType>
						<xs:attribute name="Rfc" type="tdCFDI:t_RFC" use="required">
							<xs:annotation>
								<xs:documentation>Atributo requerido para registrar la Clave del Registro Federal de Contribuyentes correspondiente al contribuyente receptor del comprobante.</xs:documentation>
							</xs:annotation>
						</xs:attribute>
						<xs:attribute name="Nombre" use="required">
							<xs:annotation>
								<xs:documentation>Atributo requerido para registrar el nombre(s), primer apellido, segundo apellido, según corresponda, denominación o razón social del contribuyente, inscrito en el RFC, del receptor del comprobante.</xs:documentation>
							</xs:annotation>
							<xs:simpleType>
								<xs:restriction base="xs:string">
									<xs:minLength value="1"/>
									<xs:maxLength value="300"/>
									<xs:whiteSpace value="collapse"/>
									<xs:pattern value="[^|]{1,300}"/>
								</xs:restriction>
							</xs:simpleType>
						</xs:attribute>
						<xs:attribute name="DomicilioFiscalReceptor" use="required">
							<xs:annotation>
								<xs:documentation>Atributo requerido para registrar el código postal del domicilio fiscal del receptor del comprobante.</xs:documentation>
							</xs:annotation>
							<xs:simpleType>
								<xs:restriction base="xs:string">
									<xs:length value="5"/>
									<xs:whiteSpace value="collapse"/>
									<xs:pattern value="[0-9]{5}"/>
								</xs:restriction>
							</xs:simpleType>
						</xs:attribute>
						<xs:attribute name="ResidenciaFiscal" type="catCFDI:c_Pais" use="optional">
							<xs:annotation>
								<xs:documentation>Atributo condicional para registrar la clave del país de residencia para efectos fiscales del receptor del comprobante, cuando se trate de un extranjero, y que es conforme con la especificación ISO 3166-1 alpha-3. Es requerido cuando se incluya el complemento de comercio exterior o se registre el atributo NumRegIdTrib.</xs:documentation>
							</xs:annotation>
						</xs:attribute>
						<xs:attribute name="NumRegIdTrib" use="optional">
							<xs:annotation>
								<xs:documentation>Atributo condicional para expresar el número de registro de identidad fiscal del receptor cuando sea residente en el extranjero. Es requerido cuando se incluya el complemento de comercio exterior.</xs:documentation>
							</xs:annotation>
							<xs:simpleType>
								<xs:restriction base="xs:string">
									<xs:minLength value="1"/>
									<xs:maxLength value="40"/>
									<xs:whiteSpace value="collapse"/>
								</xs:restriction>
							</xs:simpleType>
						</xs:attribute>
						<xs:attribute name="RegimenFiscalReceptor" type="catCFDI:c_RegimenFiscal" use="required">
							<xs:annotation>
								<xs:documentation>Atributo requerido para incorporar la clave del régimen fiscal del contribuyente receptor al que aplicará el efecto fiscal de este comprobante.</xs:documentation>
							</xs:annotation>
						</xs:attribute>
						<xs:attribute name="UsoCFDI" type="catCFDI:c_UsoCFDI" use="required">
							<xs:annotation>
								<xs:documentation>Atributo requerido para expresar la clave del uso que dará a esta factura el receptor del CFDI.</xs:documentation>
							</xs:annotation>
						</xs:attribute>
					</xs:complexType>
				</xs:element>
				<xs:element name="Conceptos">
					<xs:annotation>
						<xs:documentation>Nodo requerido para listar los conceptos cubiertos por el comprobante.</xs:documentation>
					</xs:annotation>
					<xs:complexType>
						<xs:sequence>
							<xs:element name="Concepto" maxOccurs="unbounded">
								<xs:annotation>
									<xs:documentation>Nodo requerido para registrar la información detallada de un bien o servicio amparado en el comprobante.</xs:documentation>
								</xs:annotation>
								<xs:complexType>
									<xs:sequence>
										<xs:element name="Impuestos" minOccurs="0">
											<xs:annotation>
												<xs:documentation>Nodo condicional para capturar los impuestos aplicables al presente concepto.</xs:documentation>
											</xs:annotation>
											<xs:complexType>
												<xs:sequence>
													<xs:element name="Traslados" minOccurs="0">
														<xs:annotation>
															<xs:documentation>Nodo opcional para asentar los impuestos trasladados aplicables al presente concepto.</xs:documentation>
														</xs:annotation>
														<xs:complexType>
															<xs:sequence>
																<xs:element name="Traslado" maxOccurs="unbounded">
																	<xs:annotation>
																		<xs:documentation>Nodo requerido para asentar la información detallada de un traslado de impuestos aplicable al presente concepto.</xs:documentation>
																	</xs:annotation>
																	<xs:complexType>
																		<xs:attribute name="Base" use="required">
																			<xs:annotation>
																				<xs:documentation>Atributo requerido para señalar la base para el cálculo del impuesto, la determinación de la base se realiza de acuerdo con las disposiciones fiscales vigentes. No se permiten valores negativos.</xs:documentation>
																			</xs:annotation>
																			<xs:simpleType>
																				<xs:restriction base="xs:decimal">
																					<xs:fractionDigits value="6"/>
																					<xs:minInclusive value="0.000001"/>
																					<xs:whiteSpace value="collapse"/>
																				</xs:restriction>
																			</xs:simpleType>
																		</xs:attribute>
																		<xs:attribute name="Impuesto" type="catCFDI:c_Impuesto" use="required">
																			<xs:annotation>
																				<xs:documentation>Atributo requerido para señalar la clave del tipo de impuesto trasladado aplicable al concepto.</xs:documentation>
																			</xs:annotation>
																		</xs:attribute>
																		<xs:attribute name="TipoFactor" type="catCFDI:c_TipoFactor" use="required">
																			<xs:annotation>
																				<xs:documentation>Atributo requerido para señalar la clave del tipo de factor que se aplica a la base del impuesto.</xs:documentation>
																			</xs:annotation>
																		</xs:attribute>
																		<xs:attribute name="TasaOCuota" use="optional">
																			<xs:annotation>
																				<xs:documentation>Atributo condicional para señalar el valor de la tasa o cuota del impuesto que se traslada para el presente concepto. Es requerido cuando el atributo TipoFactor tenga una clave que corresponda a Tasa o Cuota.</xs:documentation>
																			</xs:annotation>
																			<xs:simpleType>
																				<xs:restriction base="xs:decimal">
																					<xs:fractionDigits value="6"/>
																					<xs:minInclusive value="0.000000"/>
																					<xs:whiteSpace value="collapse"/>
																				</xs:restriction>
																			</xs:simpleType>
																		</xs:attribute>
																		<xs:attribute name="Importe" type="tdCFDI:t_Importe" use="optional">
																			<xs:annotation>
																				<xs:documentation>Atributo condicional para señalar el importe del impuesto trasladado que aplica al concepto. No se permiten valores negativos. Es requerido cuando TipoFactor sea Tasa o Cuota.</xs:documentation>
																			</xs:annotation>
																		</xs:attribute>
																	</xs:complexType>
																</xs:element>
															</xs:sequence>
														</xs:complexType>
													</xs:element>
													<xs:element name="Retenciones" minOccurs="0">
														<xs:annotation>
															<xs:documentation>Nodo opcional para asentar los impuestos retenidos aplicables al presente concepto.</xs:documentation>
														</xs:annotation>
														<xs:complexType>
															<xs:sequence>
																<xs:element name="Retencion" maxOccurs="unbounded">
																	<xs:annotation>
																		<xs:documentation>Nodo requerido para asentar la información detallada de una retención de impuestos aplicable al presente concepto.</xs:documentation>
																	</xs:annotation>
																	<xs:complexType>
																		<xs:attribute name="Base" use="required">
																			<xs:annotation>
																				<xs:documentation>Atributo requerido para señalar la base para el cálculo de la retención, la determinación de la base se realiza de acuerdo con las disposiciones fiscales vigentes. No se permiten valores negativos.</xs:documentation>
																			</xs:annotation>
																			<xs:simpleType>
																				<xs:restriction base="xs:decimal">
																					<xs:fractionDigits value="6"/>
																					<xs:minInclusive value="0.000001"/>
																					<xs:whiteSpace value="collapse"/>
																				</xs:restriction>
																			</xs:simpleType>
																		</xs:attribute>
																		<xs:attribute name="Impuesto" type="catCFDI:c_Impuesto" use="required">
																			<xs:annotation>
																				<xs:documentation>Atributo requerido para señalar la clave del tipo de impuesto retenido aplicable al concepto.</xs:documentation>
																			</xs:annotation>
																		</xs:attribute>
																		<xs:attribute name="TipoFactor" type="catCFDI:c_TipoFactor" use="required">
																			<xs:annotation>
																				<xs:documentation>Atributo requerido para señalar la clave del tipo de factor que se aplica a la base del impuesto.</xs:documentation>
																			</xs:annotation>
																		</xs:attribute>
																		<xs:attribute name="TasaOCuota" use="required">
																			<xs:annotation>
																				<xs:documentation>Atributo requerido para señalar la tasa o cuota del impuesto que se retiene para el presente concepto.</xs:documentation>
																			</xs:annotation>
																			<xs:simpleType>
																				<xs:restriction base="xs:decimal">
																					<xs:whiteSpace value="collapse"/>
																					<xs:minInclusive value="0.000000"/>
																					<xs:fractionDigits value="6"/>
																				</xs:restriction>
																			</xs:simpleType>
																		</xs:attribute>
																		<xs:attribute name="Importe" type="tdCFDI:t_Importe" use="required">
																			<xs:annotation>
																				<xs:documentation>Atributo requerido para señalar el importe del impuesto retenido que aplica al concepto. No se permiten valores negativos.</xs:documentation>
																			</xs:annotation>
																		</xs:attribute>
																	</xs:complexType>
																</xs:element>
															</xs:sequence>
														</xs:complexType>
													</xs:element>
												</xs:sequence>
											</xs:complexType>
										</xs:element>
										<xs:element name="ACuentaTerceros" minOccurs="0">
											<xs:annotation>
												<xs:documentation>Nodo opcional para registrar información del contribuyente Tercero, a cuenta del que se realiza la operación.</xs:documentation>
											</xs:annotation>
											<xs:complexType>
												<xs:attribute name="RfcACuentaTerceros" type="tdCFDI:t_RFC" use="required">
													<xs:annotation>
														<xs:documentation>Atributo requerido para registrar la Clave del Registro Federal de Contribuyentes del contribuyente Tercero, a cuenta del que se realiza la operación.</xs:documentation>
													</xs:annotation>
												</xs:attribute>
												<xs:attribute name="NombreACuentaTerceros" use="required">
													<xs:annotation>
														<xs:documentation>Atributo requerido para registrar el nombre, denominación o razón social del contribuyente Tercero correspondiente con el Rfc, a cuenta del que se realiza la operación.</xs:documentation>
													</xs:annotation>
													<xs:simpleType>
														<xs:restriction base="xs:string">
															<xs:minLength value="1"/>
															<xs:maxLength value="300"/>
															<xs:whiteSpace value="collapse"/>
															<xs:pattern value="[^|]{1,300}"/>
														</xs:restriction>
													</xs:simpleType>
												</xs:attribute>
												<xs:attribute name="RegimenFiscalACuentaTerceros" type="catCFDI:c_RegimenFiscal" use="required">
													<xs:annotation>
														<xs:documentation>Atributo requerido para incorporar la clave del régimen del contribuyente Tercero, a cuenta del que se realiza la operación.</xs:documentation>
													</xs:annotation>
												</xs:attribute>
												<xs:attribute name="DomicilioFiscalACuentaTerceros" use="required">
													<xs:annotation>
														<xs:documentation>Atributo requerido para incorporar el código postal del domicilio fiscal del Tercero, a cuenta del que se realiza la operación.</xs:documentation>
													</xs:annotation>
													<xs:simpleType>
														<xs:restriction base="xs:string">
															<xs:length value="5"/>
															<xs:whiteSpace value="collapse"/>
															<xs:pattern value="[0-9]{5}"/>
														</xs:restriction>
													</xs:simpleType>
												</xs:attribute>
											</xs:complexType>
										</xs:element>
										<xs:element name="InformacionAduanera" minOccurs="0" maxOccurs="unbounded">
											<xs:annotation>
												<xs:documentation>Nodo opcional para introducir la información aduanera aplicable cuando se trate de ventas de primera mano de mercancías importadas o se trate de operaciones de comercio exterior con bienes o servicios.</xs:documentation>
											</xs:annotation>
											<xs:complexType>
												<xs:attribute name="NumeroPedimento" use="required">
													<xs:annotation>
														<xs:documentation>Atributo requerido para expresar el número del pedimento que ampara la importación del bien que se expresa en el siguiente formato: últimos 2 dígitos del año de validación seguidos por dos espacios, 2 dígitos de la aduana de despacho seguidos por dos espacios, 4 dígitos del número de la patente seguidos por dos espacios, 1 dígito que corresponde al último dígito del año en curso, salvo que se trate de un pedimento consolidado iniciado en el año inmediato anterior o del pedimento original de una rectificación, seguido de 6 dígitos de la numeración progresiva por aduana.</xs:documentation>
													</xs:annotation>
													<xs:simpleType>
														<xs:restriction base="xs:string">
															<xs:length value="21"/>
															<xs:pattern value="[0-9]{2}  [0-9]{2}  [0-9]{4}  [0-9]{7}"/>
														</xs:restriction>
													</xs:simpleType>
												</xs:attribute>
											</xs:complexType>
										</xs:element>
										<xs:element name="CuentaPredial" minOccurs="0" maxOccurs="unbounded">
											<xs:annotation>
												<xs:documentation>Nodo opcional para asentar el número de cuenta predial con el que fue registrado el inmueble, en el sistema catastral de la entidad federativa de que trate, o bien para incorporar los datos de identificación del certificado de participación inmobiliaria no amortizable.</xs:documentation>
											</xs:annotation>
											<xs:complexType>
												<xs:attribute name="Numero" use="required">
													<xs:annotation>
														<xs:documentation>Atributo requerido para precisar el número de la cuenta predial del inmueble cubierto por el presente concepto, o bien para incorporar los datos de identificación del certificado de participación inmobiliaria no amortizable, tratándose de arrendamiento.</xs:documentation>
													</xs:annotation>
													<xs:simpleType>
														<xs:restriction base="xs:string">
															<xs:minLength value="1"/>
															<xs:maxLength value="150"/>
															<xs:whiteSpace value="collapse"/>
															<xs:pattern value="[0-9a-zA-Z]{1,150}"/>
														</xs:restriction>
													</xs:simpleType>
												</xs:attribute>
											</xs:complexType>
										</xs:element>
										<xs:element name="ComplementoConcepto" minOccurs="0">
											<xs:annotation>
												<xs:documentation>Nodo opcional donde se incluyen los nodos complementarios de extensión al concepto definidos por el SAT, de acuerdo con las disposiciones particulares para un sector o actividad específica.</xs:documentation>
											</xs:annotation>
											<xs:complexType>
												<xs:sequence>
													<xs:any maxOccurs="unbounded"/>
												</xs:sequence>
											</xs:complexType>
										</xs:element>
										<xs:element name="Parte" minOccurs="0" maxOccurs="unbounded">
											<xs:annotation>
												<xs:documentation>Nodo opcional para expresar las partes o componentes que integran la totalidad del concepto expresado en el comprobante fiscal digital por Internet.</xs:documentation>
											</xs:annotation>
											<xs:complexType>
												<xs:sequence>
													<xs:element name="InformacionAduanera" minOccurs="0" maxOccurs="unbounded">
														<xs:annotation>
															<xs:documentation>Nodo opcional para introducir la información aduanera aplicable cuando se trate de ventas de primera mano de mercancías importadas o se trate de operaciones de comercio exterior con bienes o servicios.</xs:documentation>
														</xs:annotation>
														<xs:complexType>
															<xs:attribute name="NumeroPedimento" use="required">
																<xs:annotation>
																	<xs:documentation>Atributo requerido para expresar el número del pedimento que ampara la importación del bien que se expresa en el siguiente formato: últimos 2 dígitos del año de validación seguidos por dos espacios, 2 dígitos de la aduana de despacho seguidos por dos espacios, 4 dígitos del número de la patente seguidos por dos espacios, 1 dígito que corresponde al último dígito del año en curso, salvo que se trate de un pedimento consolidado iniciado en el año inmediato anterior o del pedimento original de una rectificación, seguido de 6 dígitos de la numeración progresiva por aduana.</xs:documentation>
																</xs:annotation>
																<xs:simpleType>
																	<xs:restriction base="xs:string">
																		<xs:length value="21"/>
																		<xs:pattern value="[0-9]{2}  [0-9]{2}  [0-9]{4}  [0-9]{7}"/>
																	</xs:restriction>
																</xs:simpleType>
															</xs:attribute>
														</xs:complexType>
													</xs:element>
												</xs:sequence>
												<xs:attribute name="ClaveProdServ" type="catCFDI:c_ClaveProdServ" use="required">
													<xs:annotation>
														<xs:documentation>Atributo requerido para expresar la clave del producto o del servicio amparado por la presente parte. Es requerido y deben utilizar las claves del catálogo de productos y servicios, cuando los conceptos que registren por sus actividades correspondan con dichos conceptos.</xs:documentation>
													</xs:annotation>
												</xs:attribute>
												<xs:attribute name="NoIdentificacion" use="optional">
													<xs:annotation>
														<xs:documentation>Atributo opcional para expresar el número de serie, número de parte del bien o identificador del producto o del servicio amparado por la presente parte. Opcionalmente se puede utilizar claves del estándar GTIN.</xs:documentation>
													</xs:annotation>
													<xs:simpleType>
														<xs:restriction base="xs:string">
															<xs:minLength value="1"/>
															<xs:maxLength value="100"/>
															<xs:whiteSpace value="collapse"/>
															<xs:pattern value="[^|]{1,100}"/>
														</xs:restriction>
													</xs:simpleType>
												</xs:attribute>
												<xs:attribute name="Cantidad" use="required">
													<xs:annotation>
														<xs:documentation>Atributo requerido para precisar la cantidad de bienes o servicios del tipo particular definido por la presente parte.</xs:documentation>
													</xs:annotation>
													<xs:simpleType>
														<xs:restriction base="xs:decimal">
															<xs:fractionDigits value="6"/>
															<xs:minInclusive value="0.000001"/>
															<xs:whiteSpace value="collapse"/>
														</xs:restriction>
													</xs:simpleType>
												</xs:attribute>
												<xs:attribute name="Unidad" use="optional">
													<xs:annotation>
														<xs:documentation>Atributo opcional para precisar la unidad de medida propia de la operación del emisor, aplicable para la cantidad expresada en la parte. La unidad debe corresponder con la descripción de la parte. </xs:documentation>
													</xs:annotation>
													<xs:simpleType>
														<xs:restriction base="xs:string">
															<xs:minLength value="1"/>
															<xs:maxLength value="20"/>
															<xs:whiteSpace value="collapse"/>
															<xs:pattern value="[^|]{1,20}"/>
														</xs:restriction>
													</xs:simpleType>
												</xs:attribute>
												<xs:attribute name="Descripcion" use="required">
													<xs:annotation>
														<xs:documentation>Atributo requerido para precisar la descripción del bien o servicio cubierto por la presente parte.</xs:documentation>
													</xs:annotation>
													<xs:simpleType>
														<xs:restriction base="xs:string">
															<xs:minLength value="1"/>
															<xs:maxLength value="1000"/>
															<xs:whiteSpace value="collapse"/>
															<xs:pattern value="[^|]{1,1000}"/>
														</xs:restriction>
													</xs:simpleType>
												</xs:attribute>
												<xs:attribute name="ValorUnitario" type="tdCFDI:t_Importe" use="optional">
													<xs:annotation>
														<xs:documentation>Atributo opcional para precisar el valor o precio unitario del bien o servicio cubierto por la presente parte. No se permiten valores negativos.</xs:documentation>
													</xs:annotation>
												</xs:attribute>
												<xs:attribute name="Importe" type="tdCFDI:t_Importe" use="optional">
													<xs:annotation>
														<xs:documentation>Atributo opcional para precisar el importe total de los bienes o servicios de la presente parte. Debe ser equivalente al resultado de multiplicar la cantidad por el valor unitario expresado en la parte. No se permiten valores negativos.</xs:documentation>
													</xs:annotation>
												</xs:attribute>
											</xs:complexType>
										</xs:element>
									</xs:sequence>
									<xs:attribute name="ClaveProdServ" type="catCFDI:c_ClaveProdServ" use="required">
										<xs:annotation>
											<xs:documentation>Atributo requerido para expresar la clave del producto o del servicio amparado por el presente concepto. Es requerido y deben utilizar las claves del catálogo de productos y servicios, cuando los conceptos que registren por sus actividades correspondan con dichos conceptos.</xs:documentation>
										</xs:annotation>
									</xs:attribute>
									<xs:attribute name="NoIdentificacion" use="optional">
										<xs:annotation>
											<xs:documentation>Atributo opcional para expresar el número de parte, identificador del producto o del servicio, la clave de producto o servicio, SKU o equivalente, propia de la operación del emisor, amparado por el presente concepto. Opcionalmente se puede utilizar claves del estándar GTIN.</xs:documentation>
										</xs:annotation>
										<xs:simpleType>
											<xs:restriction base="xs:string">
												<xs:whiteSpace value="collapse"/>
												<xs:minLength value="1"/>
												<xs:maxLength value="100"/>
												<xs:pattern value="[^|]{1,100}"/>
											</xs:restriction>
										</xs:simpleType>
									</xs:attribute>
									<xs:attribute name="Cantidad" use="required">
										<xs:annotation>
											<xs:documentation>Atributo requerido para precisar la cantidad de bienes o servicios del tipo particular definido por el presente concepto.</xs:documentation>
										</xs:annotation>
										<xs:simpleType>
											<xs:restriction base="xs:decimal">
												<xs:fractionDigits value="6"/>
												<xs:minInclusive value="0.000001"/>
												<xs:whiteSpace value="collapse"/>
											</xs:restriction>
										</xs:simpleType>
									</xs:attribute>
									<xs:attribute name="ClaveUnidad" type="catCFDI:c_ClaveUnidad" use="required">
										<xs:annotation>
											<xs:documentation>Atributo requerido para precisar la clave de unidad de medida estandarizada aplicable para la cantidad expresada en el concepto. La unidad debe corresponder con la descripción del concepto.</xs:documentation>
										</xs:annotation>
									</xs:attribute>
									<xs:attribute name="Unidad" use="optional">
										<xs:annotation>
											<xs:documentation>Atributo opcional para precisar la unidad de medida propia de la operación del emisor, aplicable para la cantidad expresada en el concepto. La unidad debe corresponder con la descripción del concepto.</xs:documentation>
										</xs:annotation>
										<xs:simpleType>
											<xs:restriction base="xs:string">
												<xs:minLength value="1"/>
												<xs:maxLength value="20"/>
												<xs:whiteSpace value="collapse"/>
												<xs:pattern value="[^|]{1,20}"/>
											</xs:restriction>
										</xs:simpleType>
									</xs:attribute>
									<xs:attribute name="Descripcion" use="required">
										<xs:annotation>
											<xs:documentation>Atributo requerido para precisar la descripción del bien o servicio cubierto por el presente concepto.</xs:documentation>
										</xs:annotation>
										<xs:simpleType>
											<xs:restriction base="xs:string">
												<xs:minLength value="1"/>
												<xs:maxLength value="1000"/>
												<xs:whiteSpace value="collapse"/>
												<xs:pattern value="[^|]{1,1000}"/>
											</xs:restriction>
										</xs:simpleType>
									</xs:attribute>
									<xs:attribute name="ValorUnitario" type="tdCFDI:t_Importe" use="required">
										<xs:annotation>
											<xs:documentation>Atributo requerido para precisar el valor o precio unitario del bien o servicio cubierto por el presente concepto.</xs:documentation>
										</xs:annotation>
									</xs:attribute>
									<xs:attribute name="Importe" type="tdCFDI:t_Importe" use="required">
										<xs:annotation>
											<xs:documentation>Atributo requerido para precisar el importe total de los bienes o servicios del presente concepto. Debe ser equivalente al resultado de multiplicar la cantidad por el valor unitario expresado en el concepto. No se permiten valores negativos. </xs:documentation>
										</xs:annotation>
									</xs:attribute>
									<xs:attribute name="Descuento" type="tdCFDI:t_Importe" use="optional">
										<xs:annotation>
											<xs:documentation>Atributo opcional para representar el importe de los descuentos aplicables al concepto. No se permiten valores negativos.</xs:documentation>
										</xs:annotation>
									</xs:attribute>
									<xs:attribute name="ObjetoImp" type="catCFDI:c_ObjetoImp" use="required">
										<xs:annotation>
											<xs:documentation>Atributo requerido para expresar si la operación comercial es objeto o no de impuesto.</xs:documentation>
										</xs:annotation>
									</xs:attribute>
								</xs:complexType>
							</xs:element>
						</xs:sequence>
					</xs:complexType>
				</xs:element>
				<xs:element name="Impuestos" minOccurs="0">
					<xs:annotation>
						<xs:documentation>Nodo condicional para expresar el resumen de los impuestos aplicables.</xs:documentation>
					</xs:annotation>
					<xs:complexType>
						<xs:sequence>
							<xs:element name="Retenciones" minOccurs="0">
								<xs:annotation>
									<xs:documentation>Nodo condicional para capturar los impuestos retenidos aplicables. Es requerido cuando en los conceptos se registre algún impuesto retenido.</xs:documentation>
								</xs:annotation>
								<xs:complexType>
									<xs:sequence>
										<xs:element name="Retencion" maxOccurs="unbounded">
											<xs:annotation>
												<xs:documentation>Nodo requerido para la información detallada de una retención de impuesto específico.</xs:documentation>
											</xs:annotation>
											<xs:complexType>
												<xs:attribute name="Impuesto" type="catCFDI:c_Impuesto" use="required">
													<xs:annotation>
														<xs:documentation>Atributo requerido para señalar la clave del tipo de impuesto retenido.</xs:documentation>
													</xs:annotation>
												</xs:attribute>
												<xs:attribute name="Importe" type="tdCFDI:t_Importe" use="required">
													<xs:annotation>
														<xs:documentation>Atributo requerido para señalar el monto del impuesto retenido. No se permiten valores negativos.</xs:documentation>
													</xs:annotation>
												</xs:attribute>
											</xs:complexType>
										</xs:element>
									</xs:sequence>
								</xs:complexType>
							</xs:element>
							<xs:element name="Traslados" minOccurs="0">
								<xs:annotation>
									<xs:documentation>Nodo condicional para capturar los impuestos trasladados aplicables. Es requerido cuando en los conceptos se registre un impuesto trasladado.</xs:documentation>
								</xs:annotation>
								<xs:complexType>
									<xs:sequence>
										<xs:element name="Traslado" maxOccurs="unbounded">
											<xs:annotation>
												<xs:documentation>Nodo requerido para la información detallada de un traslado de impuesto específico.</xs:documentation>
											</xs:annotation>
											<xs:complexType>
												<xs:attribute name="Base" type="tdCFDI:t_Importe" use="required">
													<xs:annotation>
														<xs:documentation>Atributo requerido para señalar la suma de los atributos Base de los conceptos del impuesto trasladado. No se permiten valores negativos.</xs:documentation>
													</xs:annotation>
												</xs:attribute>
												<xs:attribute name="Impuesto" type="catCFDI:c_Impuesto" use="required">
													<xs:annotation>
														<xs:documentation>Atributo requerido para señalar la clave del tipo de impuesto trasladado.</xs:documentation>
													</xs:annotation>
												</xs:attribute>
												<xs:attribute name="TipoFactor" type="catCFDI:c_TipoFactor" use="required">
													<xs:annotation>
														<xs:documentation>Atributo requerido para señalar la clave del tipo de factor que se aplica a la base del impuesto.</xs:documentation>
													</xs:annotation>
												</xs:attribute>
												<xs:attribute name="TasaOCuota" use="optional">
													<xs:annotation>
														<xs:documentation>Atributo condicional para señalar el valor de la tasa o cuota del impuesto que se traslada por los conceptos amparados en el comprobante.</xs:documentation>
													</xs:annotation>
													<xs:simpleType>
														<xs:restriction base="xs:decimal">
															<xs:whiteSpace value="collapse"/>
															<xs:minInclusive value="0.000000"/>
															<xs:fractionDigits value="6"/>
														</xs:restriction>
													</xs:simpleType>
												</xs:attribute>
												<xs:attribute name="Importe" type="tdCFDI:t_Importe" use="optional">
													<xs:annotation>
														<xs:documentation>Atributo condicional para señalar la suma del importe del impuesto trasladado, agrupado por impuesto, TipoFactor y TasaOCuota. No se permiten valores negativos.</xs:documentation>
													</xs:annotation>
												</xs:attribute>
											</xs:complexType>
										</xs:element>
									</xs:sequence>
								</xs:complexType>
							</xs:element>
						</xs:sequence>
						<xs:attribute name="TotalImpuestosRetenidos" type="tdCFDI:t_Importe" use="optional">
							<xs:annotation>
								<xs:documentation>Atributo condicional para expresar el total de los impuestos retenidos que se desprenden de los conceptos expresados en el comprobante fiscal digital por Internet. No se permiten valores negativos. Es requerido cuando en los conceptos se registren impuestos retenidos.</xs:documentation>
							</xs:annotation>
						</xs:attribute>
						<xs:attribute name="TotalImpuestosTrasladados" type="tdCFDI:t_Importe" use="optional">
							<xs:annotation>
								<xs:documentation>Atributo condicional para expresar el total de los impuestos trasladados que se desprenden de los conceptos expresados en el comprobante fiscal digital por Internet. No se permiten valores negativos. Es requerido cuando en los conceptos se registren impuestos trasladados.</xs:documentation>
							</xs:annotation>
						</xs:attribute>
					</xs:complexType>
				</xs:element>
				<xs:element name="Complemento" minOccurs="0">
					<xs:annotation>
						<xs:documentation>Nodo opcional donde se incluye el complemento Timbre Fiscal Digital de manera obligatoria y los nodos complementarios determinados por el SAT, de acuerdo con las disposiciones particulares para un sector o actividad específica.</xs:documentation>
					</xs:annotation>
					<xs:complexType>
						<xs:sequence>
							<xs:any minOccurs="0" maxOccurs="unbounded"/>
						</xs:sequence>
					</xs:complexType>
				</xs:element>
				<xs:element name="Addenda" minOccurs="0">
					<xs:annotation>
						<xs:documentation>Nodo opcional para recibir las extensiones al presente formato que sean de utilidad al contribuyente. Para las reglas de uso del mismo, referirse al formato origen.</xs:documentation>
					</xs:annotation>
					<xs:complexType>
						<xs:sequence>
							<xs:any maxOccurs="unbounded"/>
						</xs:sequence>
					</xs:complexType>
				</xs:element>
			</xs:sequence>
			<xs:attribute name="Version" use="required" fixed="4.0">
				<xs:annotation>
					<xs:documentation>Atributo requerido con valor prefijado a 4.0 que indica la versión del estándar bajo el que se encuentra expresado el comprobante.</xs:documentation>
				</xs:annotation>
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:whiteSpace value="collapse"/>
					</xs:restriction>
				</xs:simpleType>
			</xs:attribute>
			<xs:attribute name="Serie" use="optional">
				<xs:annotation>
					<xs:documentation>Atributo opcional para precisar la serie para control interno del contribuyente. Este atributo acepta una cadena de caracteres.</xs:documentation>
				</xs:annotation>
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:minLength value="1"/>
						<xs:maxLength value="25"/>
						<xs:whiteSpace value="collapse"/>
						<xs:pattern value="[^|]{1,25}"/>
					</xs:restriction>
				</xs:simpleType>
			</xs:attribute>
			<xs:attribute name="Folio" use="optional">
				<xs:annotation>
					<xs:documentation>Atributo opcional para control interno del contribuyente que expresa el folio del comprobante, acepta una cadena de caracteres.</xs:documentation>
				</xs:annotation>
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:minLength value="1"/>
						<xs:maxLength value="40"/>
						<xs:whiteSpace value="collapse"/>
						<xs:pattern value="[^|]{1,40}"/>
					</xs:restriction>
				</xs:simpleType>
			</xs:attribute>
			<xs:attribute name="Fecha" type="tdCFDI:t_FechaH" use="required">
				<xs:annotation>
					<xs:documentation>Atributo requerido para la expresión de la fecha y hora de expedición del Comprobante Fiscal Digital por Internet. Se expresa en la forma AAAA-MM-DDThh:mm:ss y debe corresponder con la hora local donde se expide el comprobante.</xs:documentation>
				</xs:annotation>
			</xs:attribute>
			<xs:attribute name="Sello" use="required">
				<xs:annotation>
					<xs:documentation>Atributo requerido para contener el sello digital del comprobante fiscal, al que hacen referencia las reglas de resolución miscelánea vigente. El sello debe ser expresado como una cadena de texto en formato Base 64.</xs:documentation>
				</xs:annotation>
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:whiteSpace value="collapse"/>
					</xs:restriction>
				</xs:simpleType>
			</xs:attribute>
			<xs:attribute name="FormaPago" type="catCFDI:c_FormaPago" use="optional">
				<xs:annotation>
					<xs:documentation>Atributo condicional para expresar la clave de la forma de pago de los bienes o servicios amparados por el comprobante.</xs:documentation>
				</xs:annotation>
			</xs:attribute>
			<xs:attribute name="NoCertificado" use="required">
				<xs:annotation>
					<xs:documentation>Atributo requerido para expresar el número de serie del certificado de sello digital que ampara al comprobante, de acuerdo con el acuse correspondiente a 20 posiciones otorgado por el sistema del SAT.</xs:documentation>
				</xs:annotation>
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:length value="20"/>
						<xs:whiteSpace value="collapse"/>
						<xs:pattern value="[0-9]{20}"/>
					</xs:restriction>
				</xs:simpleType>
			</xs:attribute>
			<xs:attribute name="Certificado" use="required">
				<xs:annotation>
					<xs:documentation>Atributo requerido que sirve para incorporar el certificado de sello digital que ampara al comprobante, como texto en formato base 64.</xs:documentation>
				</xs:annotation>
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:whiteSpace value="collapse"/>
					</xs:restriction>
				</xs:simpleType>
			</xs:attribute>
			<xs:attribute name="CondicionesDePago" use="optional">
				<xs:annotation>
					<xs:documentation>Atributo condicional para expresar las condiciones comerciales aplicables para el pago del comprobante fiscal digital por Internet. Este atributo puede ser condicionado mediante atributos o complementos.</xs:documentation>
				</xs:annotation>
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:whiteSpace value="collapse"/>
						<xs:minLength value="1"/>
						<xs:maxLength value="1000"/>
						<xs:pattern value="[^|]{1,1000}"/>
					</xs:restriction>
				</xs:simpleType>
			</xs:attribute>
			<xs:attribute name="SubTotal" type="tdCFDI:t_Importe" use="required">
				<xs:annotation>
					<xs:documentation>Atributo requerido para representar la suma de los importes de los conceptos antes de descuentos e impuesto. No se permiten valores negativos.</xs:documentation>
				</xs:annotation>
			</xs:attribute>
			<xs:attribute name="Descuento" type="tdCFDI:t_Importe" use="optional">
				<xs:annotation>
					<xs:documentation>Atributo condicional para representar el importe total de los descuentos aplicables antes de impuestos. No se permiten valores negativos. Se debe registrar cuando existan conceptos con descuento.</xs:documentation>
				</xs:annotation>
			</xs:attribute>
			<xs:attribute name="Moneda" type="catCFDI:c_Moneda" use="required">
				<xs:annotation>
					<xs:documentation>Atributo requerido para identificar la clave de la moneda utilizada para expresar los montos, cuando se usa moneda nacional se registra MXN. Conforme con la especificación ISO 4217.</xs:documentation>
				</xs:annotation>
			</xs:attribute>
			<xs:attribute name="TipoCambio" use="optional">
				<xs:annotation>
					<xs:documentation>Atributo condicional para representar el tipo de cambio FIX conforme con la moneda usada. Es requerido cuando la clave de moneda es distinta de MXN y de XXX. El valor debe reflejar el número de pesos mexicanos que equivalen a una unidad de la divisa señalada en el atributo moneda. Si el valor está fuera del porcentaje aplicable a la moneda tomado del catálogo c_Moneda, el emisor debe obtener del PAC que vaya a timbrar el CFDI, de manera no automática, una clave de confirmación para ratificar que el valor es correcto e integrar dicha clave en el atributo Confirmacion.</xs:documentation>
				</xs:annotation>
				<xs:simpleType>
					<xs:restriction base="xs:decimal">
						<xs:fractionDigits value="6"/>
						<xs:minInclusive value="0.000001"/>
						<xs:whiteSpace value="collapse"/>
					</xs:restriction>
				</xs:simpleType>
			</xs:attribute>
			<xs:attribute name="Total" type="tdCFDI:t_Importe" use="required">
				<xs:annotation>
					<xs:documentation>Atributo requerido para representar la suma del subtotal, menos los descuentos aplicables, más las contribuciones recibidas (impuestos trasladados - federales y/o locales, derechos, productos, aprovechamientos, aportaciones de seguridad social, contribuciones de mejoras) menos los impuestos retenidos federales y/o locales. Si el valor es superior al límite que establezca el SAT en la Resolución Miscelánea Fiscal vigente, el emisor debe obtener del PAC que vaya a timbrar el CFDI, de manera no automática, una clave de confirmación para ratificar que el valor es correcto e integrar dicha clave en el atributo Confirmacion. No se permiten valores negativos. </xs:documentation>
				</xs:annotation>
			</xs:attribute>
			<xs:attribute name="TipoDeComprobante" type="catCFDI:c_TipoDeComprobante" use="required">
				<xs:annotation>
					<xs:documentation>Atributo requerido para expresar la clave del efecto del comprobante fiscal para el contribuyente emisor.</xs:documentation>
				</xs:annotation>
			</xs:attribute>
			<xs:attribute name="Exportacion" type="catCFDI:c_Exportacion" use="required">
				<xs:annotation>
					<xs:documentation>Atributo requerido para expresar si el comprobante ampara una operación de exportación.</xs:documentation>
				</xs:annotation>
			</xs:attribute>
			<xs:attribute name="MetodoPago" type="catCFDI:c_MetodoPago" use="optional">
				<xs:annotation>
					<xs:documentation>Atributo condicional para precisar la clave del método de pago que aplica para este comprobante fiscal digital por Internet, conforme al Artículo 29-A fracción VII incisos a y b del CFF.</xs:documentation>
				</xs:annotation>
			</xs:attribute>
			<xs:attribute name="LugarExpedicion" type="catCFDI:c_CodigoPostal" use="required">
				<xs:annotation>
					<xs:documentation>Atributo requerido para incorporar el código postal del lugar de expedición del comprobante (domicilio de la matriz o de la sucursal).</xs:documentation>
				</xs:annotation>
			</xs:attribute>
			<xs:attribute name="Confirmacion" use="optional">
				<xs:annotation>
					<xs:documentation>Atributo condicional para registrar la clave de confirmación que entregue el PAC para expedir el comprobante con importes grandes, con un tipo de cambio fuera del rango establecido o con ambos casos. Es requerido cuando se registra un tipo de cambio o un total fuera del rango establecido.</xs:documentation>
				</xs:annotation>
				<xs:simpleType>
					<xs:restriction base="xs:string">
						<xs:whiteSpace value="collapse"/>
						<xs:length value="5"/>
						<xs:pattern value="[0-9a-zA-Z]{5}"/>
					</xs:restriction>
				</xs:simpleType>
			</xs:attribute>
		</xs:complexType>
	</xs:element>
</xs:schema>
