-----------------------------------------------------------------------
-- Lua Script Wireshark Dissector
-- 
-- Please see end of file for rules and regulations
-----------------------------------------------------------------------

-- Iex Equities UdpHeader IexTp 1.0 Protocol
local iex_equities_udpheader_iextp_v1_0 = Proto("Iex.Equities.UdpHeader.IexTp.v1.0.Lua", "Iex Equities UdpHeader IexTp 1.0")

-- Component Tables
local show = {}
local format = {}
local display = {}
local dissect = {}
local size_of = {}
local verify = {}

-----------------------------------------------------------------------
-- Declare Protocol Fields
-----------------------------------------------------------------------

-- Iex Equities UdpHeader IexTp 1.0 Fields
iex_equities_udpheader_iextp_v1_0.fields.channel_id = ProtoField.new("Channel Id", "iex.equities.udpheader.iextp.v1.0.channelid", ftypes.UINT32)
iex_equities_udpheader_iextp_v1_0.fields.first_message_sequence_number = ProtoField.new("First Message Sequence Number", "iex.equities.udpheader.iextp.v1.0.firstmessagesequencenumber", ftypes.UINT64)
iex_equities_udpheader_iextp_v1_0.fields.iex_tp_header = ProtoField.new("Iex Tp Header", "iex.equities.udpheader.iextp.v1.0.iextpheader", ftypes.STRING)
iex_equities_udpheader_iextp_v1_0.fields.message = ProtoField.new("Message", "iex.equities.udpheader.iextp.v1.0.message", ftypes.STRING)
iex_equities_udpheader_iextp_v1_0.fields.message_count = ProtoField.new("Message Count", "iex.equities.udpheader.iextp.v1.0.messagecount", ftypes.UINT16)
iex_equities_udpheader_iextp_v1_0.fields.message_data = ProtoField.new("Message Data", "iex.equities.udpheader.iextp.v1.0.messagedata", ftypes.BYTES)
iex_equities_udpheader_iextp_v1_0.fields.message_header = ProtoField.new("Message Header", "iex.equities.udpheader.iextp.v1.0.messageheader", ftypes.STRING)
iex_equities_udpheader_iextp_v1_0.fields.message_length = ProtoField.new("Message Length", "iex.equities.udpheader.iextp.v1.0.messagelength", ftypes.UINT16)
iex_equities_udpheader_iextp_v1_0.fields.message_protocol_id = ProtoField.new("Message Protocol Id", "iex.equities.udpheader.iextp.v1.0.messageprotocolid", ftypes.UINT16)
iex_equities_udpheader_iextp_v1_0.fields.message_type = ProtoField.new("Message Type", "iex.equities.udpheader.iextp.v1.0.messagetype", ftypes.STRING)
iex_equities_udpheader_iextp_v1_0.fields.packet = ProtoField.new("Packet", "iex.equities.udpheader.iextp.v1.0.packet", ftypes.STRING)
iex_equities_udpheader_iextp_v1_0.fields.payload_length = ProtoField.new("Payload Length", "iex.equities.udpheader.iextp.v1.0.payloadlength", ftypes.UINT16)
iex_equities_udpheader_iextp_v1_0.fields.reserved = ProtoField.new("Reserved", "iex.equities.udpheader.iextp.v1.0.reserved", ftypes.BYTES)
iex_equities_udpheader_iextp_v1_0.fields.send_time = ProtoField.new("Send Time", "iex.equities.udpheader.iextp.v1.0.sendtime", ftypes.UINT64)
iex_equities_udpheader_iextp_v1_0.fields.session_id = ProtoField.new("Session Id", "iex.equities.udpheader.iextp.v1.0.sessionid", ftypes.UINT32)
iex_equities_udpheader_iextp_v1_0.fields.stream_offset = ProtoField.new("Stream Offset", "iex.equities.udpheader.iextp.v1.0.streamoffset", ftypes.UINT64)
iex_equities_udpheader_iextp_v1_0.fields.version = ProtoField.new("Version", "iex.equities.udpheader.iextp.v1.0.version", ftypes.UINT8)

-----------------------------------------------------------------------
-- Declare Dissection Options
-----------------------------------------------------------------------

-- Iex Equities UdpHeader IexTp 1.0 Element Dissection Options
show.iex_tp_header = true
show.message = true
show.message_header = true
show.packet = true

-- Register Iex Equities UdpHeader IexTp 1.0 Show Options
iex_equities_udpheader_iextp_v1_0.prefs.show_iex_tp_header = Pref.bool("Show Iex Tp Header", show.iex_tp_header, "Parse and add Iex Tp Header to protocol tree")
iex_equities_udpheader_iextp_v1_0.prefs.show_message = Pref.bool("Show Message", show.message, "Parse and add Message to protocol tree")
iex_equities_udpheader_iextp_v1_0.prefs.show_message_header = Pref.bool("Show Message Header", show.message_header, "Parse and add Message Header to protocol tree")
iex_equities_udpheader_iextp_v1_0.prefs.show_packet = Pref.bool("Show Packet", show.packet, "Parse and add Packet to protocol tree")

-- Handle changed preferences
function iex_equities_udpheader_iextp_v1_0.prefs_changed()
  local changed = false

  -- Check if show options have changed
  if show.iex_tp_header ~= iex_equities_udpheader_iextp_v1_0.prefs.show_iex_tp_header then
    show.iex_tp_header = iex_equities_udpheader_iextp_v1_0.prefs.show_iex_tp_header
    changed = true
  end
  if show.message ~= iex_equities_udpheader_iextp_v1_0.prefs.show_message then
    show.message = iex_equities_udpheader_iextp_v1_0.prefs.show_message
    changed = true
  end
  if show.message_header ~= iex_equities_udpheader_iextp_v1_0.prefs.show_message_header then
    show.message_header = iex_equities_udpheader_iextp_v1_0.prefs.show_message_header
    changed = true
  end
  if show.packet ~= iex_equities_udpheader_iextp_v1_0.prefs.show_packet then
    show.packet = iex_equities_udpheader_iextp_v1_0.prefs.show_packet
    changed = true
  end

  -- Reload on changed preference
  if changed then
    reload()
  end
end


-----------------------------------------------------------------------
-- Dissect Iex Equities UdpHeader IexTp 1.0
-----------------------------------------------------------------------

-- Display: Message Data
display.message_data = function(value)
  return "Message Data: "..value
end

-- Dissect runtime sized field: Message Data
dissect.message_data = function(buffer, offset, packet, parent, size)
  local range = buffer(offset, size)
  local value = range:bytes():tohex(false, " ")
  local display = display.message_data(value, buffer, offset, packet, parent, size)

  parent:add(iex_equities_udpheader_iextp_v1_0.fields.message_data, range, value, display)

  return offset + size
end

-- Size: Message Type
size_of.message_type = 1

-- Display: Message Type
display.message_type = function(value)
  return "Message Type: "..value
end

-- Dissect: Message Type
dissect.message_type = function(buffer, offset, packet, parent)
  local length = size_of.message_type
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.message_type(value, buffer, offset, packet, parent)

  parent:add(iex_equities_udpheader_iextp_v1_0.fields.message_type, range, value, display)

  return offset + length, value
end

-- Size: Message Length
size_of.message_length = 2

-- Display: Message Length
display.message_length = function(value)
  return "Message Length: "..value
end

-- Dissect: Message Length
dissect.message_length = function(buffer, offset, packet, parent)
  local length = size_of.message_length
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.message_length(value, buffer, offset, packet, parent)

  parent:add(iex_equities_udpheader_iextp_v1_0.fields.message_length, range, value, display)

  return offset + length, value
end

-- Calculate size of: Message Header
size_of.message_header = function(buffer, offset)
  local index = 0

  index = index + size_of.message_length

  index = index + size_of.message_type

  return index
end

-- Display: Message Header
display.message_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Message Header
dissect.message_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Message Length: 2 Byte Unsigned Fixed Width Integer
  index, message_length = dissect.message_length(buffer, index, packet, parent)

  -- Message Type: 1 Byte Ascii String
  index, message_type = dissect.message_type(buffer, index, packet, parent)

  return index
end

-- Dissect: Message Header
dissect.message_header = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.message_header then
    local length = size_of.message_header(buffer, offset)
    local range = buffer(offset, length)
    local display = display.message_header(buffer, packet, parent)
    parent = parent:add(iex_equities_udpheader_iextp_v1_0.fields.message_header, range, display)
  end

  return dissect.message_header_fields(buffer, offset, packet, parent)
end

-- Display: Message
display.message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Message
dissect.message_fields = function(buffer, offset, packet, parent, size_of_message)
  local index = offset

  -- Message Header: Struct of 2 fields
  index, message_header = dissect.message_header(buffer, index, packet, parent)

  -- Dependency element: Message Length
  local message_length = buffer(index - 3, 2):le_uint()

  -- Runtime Size Of: Message Data
  local size_of_message_data = message_length - 1

  -- Message Data: 0 Byte
  index = dissect.message_data(buffer, index, packet, parent, size_of_message_data)

  return index
end

-- Dissect: Message
dissect.message = function(buffer, offset, packet, parent, size_of_message)
  -- Optionally add struct element to protocol tree
  if show.message then
    local range = buffer(offset, size_of_message)
    local display = display.message(buffer, packet, parent)
    parent = parent:add(iex_equities_udpheader_iextp_v1_0.fields.message, range, display)
  end

  dissect.message_fields(buffer, offset, packet, parent, size_of_message)

  return offset + size_of_message
end

-- Size: Send Time
size_of.send_time = 8

-- Display: Send Time
display.send_time = function(value)
  return "Send Time: "..value
end

-- Dissect: Send Time
dissect.send_time = function(buffer, offset, packet, parent)
  local length = size_of.send_time
  local range = buffer(offset, length)
  local value = range:le_uint64()
  local display = display.send_time(value, buffer, offset, packet, parent)

  parent:add(iex_equities_udpheader_iextp_v1_0.fields.send_time, range, value, display)

  return offset + length, value
end

-- Size: First Message Sequence Number
size_of.first_message_sequence_number = 8

-- Display: First Message Sequence Number
display.first_message_sequence_number = function(value)
  return "First Message Sequence Number: "..value
end

-- Dissect: First Message Sequence Number
dissect.first_message_sequence_number = function(buffer, offset, packet, parent)
  local length = size_of.first_message_sequence_number
  local range = buffer(offset, length)
  local value = range:le_uint64()
  local display = display.first_message_sequence_number(value, buffer, offset, packet, parent)

  parent:add(iex_equities_udpheader_iextp_v1_0.fields.first_message_sequence_number, range, value, display)

  return offset + length, value
end

-- Size: Stream Offset
size_of.stream_offset = 8

-- Display: Stream Offset
display.stream_offset = function(value)
  return "Stream Offset: "..value
end

-- Dissect: Stream Offset
dissect.stream_offset = function(buffer, offset, packet, parent)
  local length = size_of.stream_offset
  local range = buffer(offset, length)
  local value = range:le_uint64()
  local display = display.stream_offset(value, buffer, offset, packet, parent)

  parent:add(iex_equities_udpheader_iextp_v1_0.fields.stream_offset, range, value, display)

  return offset + length, value
end

-- Size: Message Count
size_of.message_count = 2

-- Display: Message Count
display.message_count = function(value)
  return "Message Count: "..value
end

-- Dissect: Message Count
dissect.message_count = function(buffer, offset, packet, parent)
  local length = size_of.message_count
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.message_count(value, buffer, offset, packet, parent)

  parent:add(iex_equities_udpheader_iextp_v1_0.fields.message_count, range, value, display)

  return offset + length, value
end

-- Size: Payload Length
size_of.payload_length = 2

-- Display: Payload Length
display.payload_length = function(value)
  return "Payload Length: "..value
end

-- Dissect: Payload Length
dissect.payload_length = function(buffer, offset, packet, parent)
  local length = size_of.payload_length
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.payload_length(value, buffer, offset, packet, parent)

  parent:add(iex_equities_udpheader_iextp_v1_0.fields.payload_length, range, value, display)

  return offset + length, value
end

-- Size: Session Id
size_of.session_id = 4

-- Display: Session Id
display.session_id = function(value)
  return "Session Id: "..value
end

-- Dissect: Session Id
dissect.session_id = function(buffer, offset, packet, parent)
  local length = size_of.session_id
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.session_id(value, buffer, offset, packet, parent)

  parent:add(iex_equities_udpheader_iextp_v1_0.fields.session_id, range, value, display)

  return offset + length, value
end

-- Size: Channel Id
size_of.channel_id = 4

-- Display: Channel Id
display.channel_id = function(value)
  return "Channel Id: "..value
end

-- Dissect: Channel Id
dissect.channel_id = function(buffer, offset, packet, parent)
  local length = size_of.channel_id
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.channel_id(value, buffer, offset, packet, parent)

  parent:add(iex_equities_udpheader_iextp_v1_0.fields.channel_id, range, value, display)

  return offset + length, value
end

-- Size: Message Protocol Id
size_of.message_protocol_id = 2

-- Display: Message Protocol Id
display.message_protocol_id = function(value)
  return "Message Protocol Id: "..value
end

-- Dissect: Message Protocol Id
dissect.message_protocol_id = function(buffer, offset, packet, parent)
  local length = size_of.message_protocol_id
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.message_protocol_id(value, buffer, offset, packet, parent)

  parent:add(iex_equities_udpheader_iextp_v1_0.fields.message_protocol_id, range, value, display)

  return offset + length, value
end

-- Size: Reserved
size_of.reserved = 1

-- Display: Reserved
display.reserved = function(value)
  return "Reserved: "..value
end

-- Dissect: Reserved
dissect.reserved = function(buffer, offset, packet, parent)
  local length = size_of.reserved
  local range = buffer(offset, length)
  local value = range:bytes():tohex(false, " ")
  local display = display.reserved(value, buffer, offset, packet, parent)

  parent:add(iex_equities_udpheader_iextp_v1_0.fields.reserved, range, value, display)

  return offset + length, value
end

-- Size: Version
size_of.version = 1

-- Display: Version
display.version = function(value)
  return "Version: "..value
end

-- Dissect: Version
dissect.version = function(buffer, offset, packet, parent)
  local length = size_of.version
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.version(value, buffer, offset, packet, parent)

  parent:add(iex_equities_udpheader_iextp_v1_0.fields.version, range, value, display)

  return offset + length, value
end

-- Calculate size of: Iex Tp Header
size_of.iex_tp_header = function(buffer, offset)
  local index = 0

  index = index + size_of.version

  index = index + size_of.reserved

  index = index + size_of.message_protocol_id

  index = index + size_of.channel_id

  index = index + size_of.session_id

  index = index + size_of.payload_length

  index = index + size_of.message_count

  index = index + size_of.stream_offset

  index = index + size_of.first_message_sequence_number

  index = index + size_of.send_time

  return index
end

-- Display: Iex Tp Header
display.iex_tp_header = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Iex Tp Header
dissect.iex_tp_header_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Version: 1 Byte Unsigned Fixed Width Integer
  index, version = dissect.version(buffer, index, packet, parent)

  -- Reserved: 1 Byte
  index, reserved = dissect.reserved(buffer, index, packet, parent)

  -- Message Protocol Id: 2 Byte Unsigned Fixed Width Integer
  index, message_protocol_id = dissect.message_protocol_id(buffer, index, packet, parent)

  -- Channel Id: 4 Byte Unsigned Fixed Width Integer
  index, channel_id = dissect.channel_id(buffer, index, packet, parent)

  -- Session Id: 4 Byte Unsigned Fixed Width Integer
  index, session_id = dissect.session_id(buffer, index, packet, parent)

  -- Payload Length: 2 Byte Unsigned Fixed Width Integer
  index, payload_length = dissect.payload_length(buffer, index, packet, parent)

  -- Message Count: 2 Byte Unsigned Fixed Width Integer
  index, message_count = dissect.message_count(buffer, index, packet, parent)

  -- Stream Offset: 8 Byte Unsigned Fixed Width Integer
  index, stream_offset = dissect.stream_offset(buffer, index, packet, parent)

  -- First Message Sequence Number: 8 Byte Unsigned Fixed Width Integer
  index, first_message_sequence_number = dissect.first_message_sequence_number(buffer, index, packet, parent)

  -- Send Time: 8 Byte Unsigned Fixed Width Integer
  index, send_time = dissect.send_time(buffer, index, packet, parent)

  return index
end

-- Dissect: Iex Tp Header
dissect.iex_tp_header = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.iex_tp_header then
    local length = size_of.iex_tp_header(buffer, offset)
    local range = buffer(offset, length)
    local display = display.iex_tp_header(buffer, packet, parent)
    parent = parent:add(iex_equities_udpheader_iextp_v1_0.fields.iex_tp_header, range, display)
  end

  return dissect.iex_tp_header_fields(buffer, offset, packet, parent)
end

-- Dissect Packet
dissect.packet = function(buffer, packet, parent)
  local index = 0

  -- Iex Tp Header: Struct of 10 fields
  index, iex_tp_header = dissect.iex_tp_header(buffer, index, packet, parent)

  -- Dependency element: Message Count
  local message_count = buffer(index - 26, 2):le_uint()

  -- Message: Struct of 2 fields
  for i = 1, message_count do

    -- Dependency element: Message Length
    local message_length = buffer(index, 2):le_uint()

    -- Runtime Size Of: Message
    local size_of_message = message_length + 2

    -- Message: Struct of 2 fields
    index = dissect.message(buffer, index, packet, parent, size_of_message)
  end

  return index
end


-----------------------------------------------------------------------
-- Protocol Dissector and Components
-----------------------------------------------------------------------

-- Initialize Dissector
function iex_equities_udpheader_iextp_v1_0.init()
end

-- Dissector for Iex Equities UdpHeader IexTp 1.0
function iex_equities_udpheader_iextp_v1_0.dissector(buffer, packet, parent)

  -- Set protocol name
  packet.cols.protocol = iex_equities_udpheader_iextp_v1_0.name

  -- Dissect protocol
  local protocol = parent:add(iex_equities_udpheader_iextp_v1_0, buffer(), iex_equities_udpheader_iextp_v1_0.description, "("..buffer:len().." Bytes)")
  return dissect.packet(buffer, packet, protocol)
end

-- Register With Udp Table
local udp_table = DissectorTable.get("udp.port")
udp_table:add(65333, iex_equities_udpheader_iextp_v1_0)


-----------------------------------------------------------------------
-- Protocol Heuristics
-----------------------------------------------------------------------

-- Verify size of packet
verify.iex_equities_udpheader_iextp_v1_0_packet_size = function(buffer)

  return true
end

-- Dissector Heuristic for Iex Equities UdpHeader IexTp 1.0
local function iex_equities_udpheader_iextp_v1_0_heuristic(buffer, packet, parent)
  -- Verify packet length
  if not verify.iex_equities_udpheader_iextp_v1_0_packet_size(buffer) then return false end

  -- Protocol is valid, set conversation and dissect this packet
  packet.conversation = iex_equities_udpheader_iextp_v1_0
  iex_equities_udpheader_iextp_v1_0.dissector(buffer, packet, parent)

  return true
end

-- Register Heuristic for Iex Equities UdpHeader IexTp 1.0
iex_equities_udpheader_iextp_v1_0:register_heuristic("udp", iex_equities_udpheader_iextp_v1_0_heuristic)

-----------------------------------------------------------------------
-- Lua dissectors are an easily edited and modified cross platform dissection solution.
-- Feel free to modify. Enjoy.
-----------------------------------------------------------------------
-- 
-- Protocol:
--   Organization: Investors Exchange
--   Version: 1.0
--   Date: Sunday, September 20, 2015
--   Specification: IEX Transport Specification.pdf
-- 
-- Script:
--   Generator: 1.5.0.0
--   Compiler: 2.0
--   License: Public/GPLv3
--   Authors: Omi Developers
-- 
-- This script was generated by the Open Markets Initiative (Omi).
-- 
-- For full Omi information:
-- https://github.com/Open-Markets-Initiative/Directory
-----------------------------------------------------------------------
