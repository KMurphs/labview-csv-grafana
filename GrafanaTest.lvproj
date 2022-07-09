<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="17008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="private" Type="Folder" URL="../private">
			<Property Name="NI.DISK" Type="Bool">true</Property>
		</Item>
		<Item Name="grafana-test-server" Type="Web Service">
			<Property Name="ws.guid" Type="Str">{ED7DDFE5-493D-4125-9B22-B74E6D8E1957}</Property>
			<Property Name="ws.public_folder_name" Type="Str">public</Property>
			<Item Name="Public Content" Type="Folder" URL="../public">
				<Property Name="NI.DISK" Type="Bool">true</Property>
			</Item>
			<Item Name="Startup VIs" Type="Startup VIs Container"/>
			<Item Name="Web Resources" Type="HTTP WebResources Container"/>
		</Item>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
