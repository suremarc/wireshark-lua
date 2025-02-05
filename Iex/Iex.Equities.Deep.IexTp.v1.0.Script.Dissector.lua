-----------------------------------------------------------------------
-- Lua Script Wireshark Dissector
-- 
-- Please see end of file for rules and regulations
-----------------------------------------------------------------------

-- Iex Equities Deep IexTp 1.0 Protocol
local iex_equities_deep_iextp_v1_0 = Proto("Iex.Equities.Deep.IexTp.v1.0.Lua", "Iex Equities Deep IexTp 1.0")

-- Component Tables
local show = {}
local format = {}
local display = {}
local dissect = {}
local size_of = {}
local verify = {}
local translate = {}

-----------------------------------------------------------------------
-- Declare Protocol Fields
-----------------------------------------------------------------------

-- Iex Equities Deep IexTp 1.0 Fields
iex_equities_deep_iextp_v1_0.fields.adjusted_poc_price = ProtoField.new("Adjusted Poc Price", "iex.equities.deep.iextp.v1.0.adjustedpocprice", ftypes.DOUBLE)
iex_equities_deep_iextp_v1_0.fields.auction_book_clearing_price = ProtoField.new("Auction Book Clearing Price", "iex.equities.deep.iextp.v1.0.auctionbookclearingprice", ftypes.DOUBLE)
iex_equities_deep_iextp_v1_0.fields.auction_information_message = ProtoField.new("Auction Information Message", "iex.equities.deep.iextp.v1.0.auctioninformationmessage", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.auction_type = ProtoField.new("Auction Type", "iex.equities.deep.iextp.v1.0.auctiontype", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.channel_id = ProtoField.new("Channel Id", "iex.equities.deep.iextp.v1.0.channelid", ftypes.UINT32)
iex_equities_deep_iextp_v1_0.fields.collar_reference_price = ProtoField.new("Collar Reference Price", "iex.equities.deep.iextp.v1.0.collarreferenceprice", ftypes.DOUBLE)
iex_equities_deep_iextp_v1_0.fields.detail = ProtoField.new("Detail", "iex.equities.deep.iextp.v1.0.detail", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.etp = ProtoField.new("Etp", "iex.equities.deep.iextp.v1.0.etp", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x80")
iex_equities_deep_iextp_v1_0.fields.event_flags = ProtoField.new("Event Flags", "iex.equities.deep.iextp.v1.0.eventflags", ftypes.UINT8)
iex_equities_deep_iextp_v1_0.fields.extended_hours = ProtoField.new("Extended Hours", "iex.equities.deep.iextp.v1.0.extendedhours", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x40")
iex_equities_deep_iextp_v1_0.fields.extension_number = ProtoField.new("Extension Number", "iex.equities.deep.iextp.v1.0.extensionnumber", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.first_message_sequence_number = ProtoField.new("First Message Sequence Number", "iex.equities.deep.iextp.v1.0.firstmessagesequencenumber", ftypes.UINT64)
iex_equities_deep_iextp_v1_0.fields.iex_tp_header = ProtoField.new("Iex Tp Header", "iex.equities.deep.iextp.v1.0.iextpheader", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.imbalance_shares = ProtoField.new("Imbalance Shares", "iex.equities.deep.iextp.v1.0.imbalanceshares", ftypes.UINT32)
iex_equities_deep_iextp_v1_0.fields.imbalance_side = ProtoField.new("Imbalance Side", "iex.equities.deep.iextp.v1.0.imbalanceside", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.indicative_clearing_price = ProtoField.new("Indicative Clearing Price", "iex.equities.deep.iextp.v1.0.indicativeclearingprice", ftypes.DOUBLE)
iex_equities_deep_iextp_v1_0.fields.intermarket_sweep = ProtoField.new("Intermarket Sweep", "iex.equities.deep.iextp.v1.0.intermarketsweep", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x80")
iex_equities_deep_iextp_v1_0.fields.lower_auction_collar = ProtoField.new("Lower Auction Collar", "iex.equities.deep.iextp.v1.0.lowerauctioncollar", ftypes.DOUBLE)
iex_equities_deep_iextp_v1_0.fields.luld_tier = ProtoField.new("Luld Tier", "iex.equities.deep.iextp.v1.0.luldtier", ftypes.UINT8)
iex_equities_deep_iextp_v1_0.fields.message = ProtoField.new("Message", "iex.equities.deep.iextp.v1.0.message", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.message_count = ProtoField.new("Message Count", "iex.equities.deep.iextp.v1.0.messagecount", ftypes.UINT16)
iex_equities_deep_iextp_v1_0.fields.message_data = ProtoField.new("Message Data", "iex.equities.deep.iextp.v1.0.messagedata", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.message_header = ProtoField.new("Message Header", "iex.equities.deep.iextp.v1.0.messageheader", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.message_length = ProtoField.new("Message Length", "iex.equities.deep.iextp.v1.0.messagelength", ftypes.UINT16)
iex_equities_deep_iextp_v1_0.fields.message_protocol_id = ProtoField.new("Message Protocol Id", "iex.equities.deep.iextp.v1.0.messageprotocolid", ftypes.UINT16)
iex_equities_deep_iextp_v1_0.fields.message_type = ProtoField.new("Message Type", "iex.equities.deep.iextp.v1.0.messagetype", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.odd_lot = ProtoField.new("Odd Lot", "iex.equities.deep.iextp.v1.0.oddlot", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x20")
iex_equities_deep_iextp_v1_0.fields.official_price = ProtoField.new("Official Price", "iex.equities.deep.iextp.v1.0.officialprice", ftypes.DOUBLE)
iex_equities_deep_iextp_v1_0.fields.official_price_message = ProtoField.new("Official Price Message", "iex.equities.deep.iextp.v1.0.officialpricemessage", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.operational_halt_status = ProtoField.new("Operational Halt Status", "iex.equities.deep.iextp.v1.0.operationalhaltstatus", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.operational_halt_status_message = ProtoField.new("Operational Halt Status Message", "iex.equities.deep.iextp.v1.0.operationalhaltstatusmessage", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.packet = ProtoField.new("Packet", "iex.equities.deep.iextp.v1.0.packet", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.paired_shares = ProtoField.new("Paired Shares", "iex.equities.deep.iextp.v1.0.pairedshares", ftypes.UINT32)
iex_equities_deep_iextp_v1_0.fields.payload_length = ProtoField.new("Payload Length", "iex.equities.deep.iextp.v1.0.payloadlength", ftypes.UINT16)
iex_equities_deep_iextp_v1_0.fields.price = ProtoField.new("Price", "iex.equities.deep.iextp.v1.0.price", ftypes.DOUBLE)
iex_equities_deep_iextp_v1_0.fields.price_level_buy_update_message = ProtoField.new("Price Level Buy Update Message", "iex.equities.deep.iextp.v1.0.pricelevelbuyupdatemessage", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.price_level_sell_update_message = ProtoField.new("Price Level Sell Update Message", "iex.equities.deep.iextp.v1.0.pricelevelsellupdatemessage", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.price_type = ProtoField.new("Price Type", "iex.equities.deep.iextp.v1.0.pricetype", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.reason = ProtoField.new("Reason", "iex.equities.deep.iextp.v1.0.reason", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.reference_price = ProtoField.new("Reference Price", "iex.equities.deep.iextp.v1.0.referenceprice", ftypes.DOUBLE)
iex_equities_deep_iextp_v1_0.fields.reserved = ProtoField.new("Reserved", "iex.equities.deep.iextp.v1.0.reserved", ftypes.BYTES)
iex_equities_deep_iextp_v1_0.fields.round_lot_size = ProtoField.new("Round Lot Size", "iex.equities.deep.iextp.v1.0.roundlotsize", ftypes.UINT32)
iex_equities_deep_iextp_v1_0.fields.sale_condition_flags = ProtoField.new("Sale Condition Flags", "iex.equities.deep.iextp.v1.0.saleconditionflags", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.scheduled_auction_time = ProtoField.new("Scheduled Auction Time", "iex.equities.deep.iextp.v1.0.scheduledauctiontime", ftypes.UINT32)
iex_equities_deep_iextp_v1_0.fields.security_directory_flags = ProtoField.new("Security Directory Flags", "iex.equities.deep.iextp.v1.0.securitydirectoryflags", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.security_directory_message = ProtoField.new("Security Directory Message", "iex.equities.deep.iextp.v1.0.securitydirectorymessage", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.security_event = ProtoField.new("Security Event", "iex.equities.deep.iextp.v1.0.securityevent", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.security_event_message = ProtoField.new("Security Event Message", "iex.equities.deep.iextp.v1.0.securityeventmessage", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.send_time = ProtoField.new("Send Time", "iex.equities.deep.iextp.v1.0.sendtime", ftypes.UINT64)
iex_equities_deep_iextp_v1_0.fields.session_id = ProtoField.new("Session Id", "iex.equities.deep.iextp.v1.0.sessionid", ftypes.UINT32)
iex_equities_deep_iextp_v1_0.fields.short_sale_price_test_status = ProtoField.new("Short Sale Price Test Status", "iex.equities.deep.iextp.v1.0.shortsalepriceteststatus", ftypes.UINT8)
iex_equities_deep_iextp_v1_0.fields.short_sale_price_test_status_message = ProtoField.new("Short Sale Price Test Status Message", "iex.equities.deep.iextp.v1.0.shortsalepriceteststatusmessage", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.singleprice_cross_trade = ProtoField.new("Singleprice Cross Trade", "iex.equities.deep.iextp.v1.0.singlepricecrosstrade", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x08")
iex_equities_deep_iextp_v1_0.fields.size = ProtoField.new("Size", "iex.equities.deep.iextp.v1.0.size", ftypes.UINT32)
iex_equities_deep_iextp_v1_0.fields.stream_offset = ProtoField.new("Stream Offset", "iex.equities.deep.iextp.v1.0.streamoffset", ftypes.UINT64)
iex_equities_deep_iextp_v1_0.fields.symbol = ProtoField.new("Symbol", "iex.equities.deep.iextp.v1.0.symbol", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.system_event = ProtoField.new("System Event", "iex.equities.deep.iextp.v1.0.systemevent", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.system_event_message = ProtoField.new("System Event Message", "iex.equities.deep.iextp.v1.0.systemeventmessage", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.test_security = ProtoField.new("Test Security", "iex.equities.deep.iextp.v1.0.testsecurity", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x20")
iex_equities_deep_iextp_v1_0.fields.timestamp = ProtoField.new("Timestamp", "iex.equities.deep.iextp.v1.0.timestamp", ftypes.INT64)
iex_equities_deep_iextp_v1_0.fields.trade_break_message = ProtoField.new("Trade Break Message", "iex.equities.deep.iextp.v1.0.tradebreakmessage", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.trade_id = ProtoField.new("Trade Id", "iex.equities.deep.iextp.v1.0.tradeid", ftypes.UINT64)
iex_equities_deep_iextp_v1_0.fields.trade_report_message = ProtoField.new("Trade Report Message", "iex.equities.deep.iextp.v1.0.tradereportmessage", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.trade_through_exempt = ProtoField.new("Trade Through Exempt", "iex.equities.deep.iextp.v1.0.tradethroughexempt", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x10")
iex_equities_deep_iextp_v1_0.fields.trading_status = ProtoField.new("Trading Status", "iex.equities.deep.iextp.v1.0.tradingstatus", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.trading_status_message = ProtoField.new("Trading Status Message", "iex.equities.deep.iextp.v1.0.tradingstatusmessage", ftypes.STRING)
iex_equities_deep_iextp_v1_0.fields.unused_3 = ProtoField.new("Unused 3", "iex.equities.deep.iextp.v1.0.unused3", ftypes.UINT8, nil, base.DEC, "0x07")
iex_equities_deep_iextp_v1_0.fields.unused_5 = ProtoField.new("Unused 5", "iex.equities.deep.iextp.v1.0.unused5", ftypes.UINT8, nil, base.DEC, "0x1F")
iex_equities_deep_iextp_v1_0.fields.upper_auction_collar = ProtoField.new("Upper Auction Collar", "iex.equities.deep.iextp.v1.0.upperauctioncollar", ftypes.DOUBLE)
iex_equities_deep_iextp_v1_0.fields.version = ProtoField.new("Version", "iex.equities.deep.iextp.v1.0.version", ftypes.UINT8)
iex_equities_deep_iextp_v1_0.fields.when_issued = ProtoField.new("When Issued", "iex.equities.deep.iextp.v1.0.whenissued", ftypes.UINT8, {[1]="Yes",[0]="No"}, base.DEC, "0x40")

-----------------------------------------------------------------------
-- Declare Dissection Options
-----------------------------------------------------------------------

-- Iex Equities Deep IexTp 1.0 Element Dissection Options
show.auction_information_message = true
show.iex_tp_header = true
show.message = true
show.message_header = true
show.official_price_message = true
show.operational_halt_status_message = true
show.packet = true
show.price_level_buy_update_message = true
show.price_level_sell_update_message = true
show.sale_condition_flags = true
show.security_directory_flags = true
show.security_directory_message = true
show.security_event_message = true
show.short_sale_price_test_status_message = true
show.system_event_message = true
show.trade_break_message = true
show.trade_report_message = true
show.trading_status_message = true
show.message_data = false

-- Register Iex Equities Deep IexTp 1.0 Show Options
iex_equities_deep_iextp_v1_0.prefs.show_auction_information_message = Pref.bool("Show Auction Information Message", show.auction_information_message, "Parse and add Auction Information Message to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_iex_tp_header = Pref.bool("Show Iex Tp Header", show.iex_tp_header, "Parse and add Iex Tp Header to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_message = Pref.bool("Show Message", show.message, "Parse and add Message to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_message_header = Pref.bool("Show Message Header", show.message_header, "Parse and add Message Header to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_official_price_message = Pref.bool("Show Official Price Message", show.official_price_message, "Parse and add Official Price Message to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_operational_halt_status_message = Pref.bool("Show Operational Halt Status Message", show.operational_halt_status_message, "Parse and add Operational Halt Status Message to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_packet = Pref.bool("Show Packet", show.packet, "Parse and add Packet to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_price_level_buy_update_message = Pref.bool("Show Price Level Buy Update Message", show.price_level_buy_update_message, "Parse and add Price Level Buy Update Message to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_price_level_sell_update_message = Pref.bool("Show Price Level Sell Update Message", show.price_level_sell_update_message, "Parse and add Price Level Sell Update Message to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_sale_condition_flags = Pref.bool("Show Sale Condition Flags", show.sale_condition_flags, "Parse and add Sale Condition Flags to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_security_directory_flags = Pref.bool("Show Security Directory Flags", show.security_directory_flags, "Parse and add Security Directory Flags to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_security_directory_message = Pref.bool("Show Security Directory Message", show.security_directory_message, "Parse and add Security Directory Message to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_security_event_message = Pref.bool("Show Security Event Message", show.security_event_message, "Parse and add Security Event Message to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_short_sale_price_test_status_message = Pref.bool("Show Short Sale Price Test Status Message", show.short_sale_price_test_status_message, "Parse and add Short Sale Price Test Status Message to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_system_event_message = Pref.bool("Show System Event Message", show.system_event_message, "Parse and add System Event Message to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_trade_break_message = Pref.bool("Show Trade Break Message", show.trade_break_message, "Parse and add Trade Break Message to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_trade_report_message = Pref.bool("Show Trade Report Message", show.trade_report_message, "Parse and add Trade Report Message to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_trading_status_message = Pref.bool("Show Trading Status Message", show.trading_status_message, "Parse and add Trading Status Message to protocol tree")
iex_equities_deep_iextp_v1_0.prefs.show_message_data = Pref.bool("Show Message Data", show.message_data, "Parse and add Message Data to protocol tree")

-- Handle changed preferences
function iex_equities_deep_iextp_v1_0.prefs_changed()
  local changed = false

  -- Check if show options have changed
  if show.auction_information_message ~= iex_equities_deep_iextp_v1_0.prefs.show_auction_information_message then
    show.auction_information_message = iex_equities_deep_iextp_v1_0.prefs.show_auction_information_message
    changed = true
  end
  if show.iex_tp_header ~= iex_equities_deep_iextp_v1_0.prefs.show_iex_tp_header then
    show.iex_tp_header = iex_equities_deep_iextp_v1_0.prefs.show_iex_tp_header
    changed = true
  end
  if show.message ~= iex_equities_deep_iextp_v1_0.prefs.show_message then
    show.message = iex_equities_deep_iextp_v1_0.prefs.show_message
    changed = true
  end
  if show.message_header ~= iex_equities_deep_iextp_v1_0.prefs.show_message_header then
    show.message_header = iex_equities_deep_iextp_v1_0.prefs.show_message_header
    changed = true
  end
  if show.official_price_message ~= iex_equities_deep_iextp_v1_0.prefs.show_official_price_message then
    show.official_price_message = iex_equities_deep_iextp_v1_0.prefs.show_official_price_message
    changed = true
  end
  if show.operational_halt_status_message ~= iex_equities_deep_iextp_v1_0.prefs.show_operational_halt_status_message then
    show.operational_halt_status_message = iex_equities_deep_iextp_v1_0.prefs.show_operational_halt_status_message
    changed = true
  end
  if show.packet ~= iex_equities_deep_iextp_v1_0.prefs.show_packet then
    show.packet = iex_equities_deep_iextp_v1_0.prefs.show_packet
    changed = true
  end
  if show.price_level_buy_update_message ~= iex_equities_deep_iextp_v1_0.prefs.show_price_level_buy_update_message then
    show.price_level_buy_update_message = iex_equities_deep_iextp_v1_0.prefs.show_price_level_buy_update_message
    changed = true
  end
  if show.price_level_sell_update_message ~= iex_equities_deep_iextp_v1_0.prefs.show_price_level_sell_update_message then
    show.price_level_sell_update_message = iex_equities_deep_iextp_v1_0.prefs.show_price_level_sell_update_message
    changed = true
  end
  if show.sale_condition_flags ~= iex_equities_deep_iextp_v1_0.prefs.show_sale_condition_flags then
    show.sale_condition_flags = iex_equities_deep_iextp_v1_0.prefs.show_sale_condition_flags
    changed = true
  end
  if show.security_directory_flags ~= iex_equities_deep_iextp_v1_0.prefs.show_security_directory_flags then
    show.security_directory_flags = iex_equities_deep_iextp_v1_0.prefs.show_security_directory_flags
    changed = true
  end
  if show.security_directory_message ~= iex_equities_deep_iextp_v1_0.prefs.show_security_directory_message then
    show.security_directory_message = iex_equities_deep_iextp_v1_0.prefs.show_security_directory_message
    changed = true
  end
  if show.security_event_message ~= iex_equities_deep_iextp_v1_0.prefs.show_security_event_message then
    show.security_event_message = iex_equities_deep_iextp_v1_0.prefs.show_security_event_message
    changed = true
  end
  if show.short_sale_price_test_status_message ~= iex_equities_deep_iextp_v1_0.prefs.show_short_sale_price_test_status_message then
    show.short_sale_price_test_status_message = iex_equities_deep_iextp_v1_0.prefs.show_short_sale_price_test_status_message
    changed = true
  end
  if show.system_event_message ~= iex_equities_deep_iextp_v1_0.prefs.show_system_event_message then
    show.system_event_message = iex_equities_deep_iextp_v1_0.prefs.show_system_event_message
    changed = true
  end
  if show.trade_break_message ~= iex_equities_deep_iextp_v1_0.prefs.show_trade_break_message then
    show.trade_break_message = iex_equities_deep_iextp_v1_0.prefs.show_trade_break_message
    changed = true
  end
  if show.trade_report_message ~= iex_equities_deep_iextp_v1_0.prefs.show_trade_report_message then
    show.trade_report_message = iex_equities_deep_iextp_v1_0.prefs.show_trade_report_message
    changed = true
  end
  if show.trading_status_message ~= iex_equities_deep_iextp_v1_0.prefs.show_trading_status_message then
    show.trading_status_message = iex_equities_deep_iextp_v1_0.prefs.show_trading_status_message
    changed = true
  end
  if show.message_data ~= iex_equities_deep_iextp_v1_0.prefs.show_message_data then
    show.message_data = iex_equities_deep_iextp_v1_0.prefs.show_message_data
    changed = true
  end

  -- Reload on changed preference
  if changed then
    reload()
  end
end


-----------------------------------------------------------------------
-- Dissect Iex Equities Deep IexTp 1.0
-----------------------------------------------------------------------

-- Size: Upper Auction Collar
size_of.upper_auction_collar = 8

-- Display: Upper Auction Collar
display.upper_auction_collar = function(value)
  return "Upper Auction Collar: "..value
end

-- Translate: Upper Auction Collar
translate.upper_auction_collar = function(raw)
  return raw:tonumber()/10000
end

-- Dissect: Upper Auction Collar
dissect.upper_auction_collar = function(buffer, offset, packet, parent)
  local length = size_of.upper_auction_collar
  local range = buffer(offset, length)
  local raw = range:le_int64()
  local value = translate.upper_auction_collar(raw)
  local display = display.upper_auction_collar(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.upper_auction_collar, range, value, display)

  return offset + length, value
end

-- Size: Lower Auction Collar
size_of.lower_auction_collar = 8

-- Display: Lower Auction Collar
display.lower_auction_collar = function(value)
  return "Lower Auction Collar: "..value
end

-- Translate: Lower Auction Collar
translate.lower_auction_collar = function(raw)
  return raw:tonumber()/10000
end

-- Dissect: Lower Auction Collar
dissect.lower_auction_collar = function(buffer, offset, packet, parent)
  local length = size_of.lower_auction_collar
  local range = buffer(offset, length)
  local raw = range:le_int64()
  local value = translate.lower_auction_collar(raw)
  local display = display.lower_auction_collar(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.lower_auction_collar, range, value, display)

  return offset + length, value
end

-- Size: Collar Reference Price
size_of.collar_reference_price = 8

-- Display: Collar Reference Price
display.collar_reference_price = function(value)
  return "Collar Reference Price: "..value
end

-- Translate: Collar Reference Price
translate.collar_reference_price = function(raw)
  return raw:tonumber()/10000
end

-- Dissect: Collar Reference Price
dissect.collar_reference_price = function(buffer, offset, packet, parent)
  local length = size_of.collar_reference_price
  local range = buffer(offset, length)
  local raw = range:le_int64()
  local value = translate.collar_reference_price(raw)
  local display = display.collar_reference_price(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.collar_reference_price, range, value, display)

  return offset + length, value
end

-- Size: Auction Book Clearing Price
size_of.auction_book_clearing_price = 8

-- Display: Auction Book Clearing Price
display.auction_book_clearing_price = function(value)
  return "Auction Book Clearing Price: "..value
end

-- Translate: Auction Book Clearing Price
translate.auction_book_clearing_price = function(raw)
  return raw:tonumber()/10000
end

-- Dissect: Auction Book Clearing Price
dissect.auction_book_clearing_price = function(buffer, offset, packet, parent)
  local length = size_of.auction_book_clearing_price
  local range = buffer(offset, length)
  local raw = range:le_int64()
  local value = translate.auction_book_clearing_price(raw)
  local display = display.auction_book_clearing_price(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.auction_book_clearing_price, range, value, display)

  return offset + length, value
end

-- Size: Scheduled Auction Time
size_of.scheduled_auction_time = 4

-- Display: Scheduled Auction Time
display.scheduled_auction_time = function(value)
  return "Scheduled Auction Time: "..value
end

-- Dissect: Scheduled Auction Time
dissect.scheduled_auction_time = function(buffer, offset, packet, parent)
  local length = size_of.scheduled_auction_time
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.scheduled_auction_time(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.scheduled_auction_time, range, value, display)

  return offset + length, value
end

-- Size: Extension Number
size_of.extension_number = 1

-- Display: Extension Number
display.extension_number = function(value)
  return "Extension Number: "..value
end

-- Dissect: Extension Number
dissect.extension_number = function(buffer, offset, packet, parent)
  local length = size_of.extension_number
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.extension_number(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.extension_number, range, value, display)

  return offset + length, value
end

-- Size: Imbalance Side
size_of.imbalance_side = 1

-- Display: Imbalance Side
display.imbalance_side = function(value)
  if value == "B" then
    return "Imbalance Side: Buy (B)"
  end
  if value == "S" then
    return "Imbalance Side: Sell (S)"
  end
  if value == "N" then
    return "Imbalance Side: None (N)"
  end

  return "Imbalance Side: Unknown("..value..")"
end

-- Dissect: Imbalance Side
dissect.imbalance_side = function(buffer, offset, packet, parent)
  local length = size_of.imbalance_side
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.imbalance_side(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.imbalance_side, range, value, display)

  return offset + length, value
end

-- Size: Imbalance Shares
size_of.imbalance_shares = 4

-- Display: Imbalance Shares
display.imbalance_shares = function(value)
  return "Imbalance Shares: "..value
end

-- Dissect: Imbalance Shares
dissect.imbalance_shares = function(buffer, offset, packet, parent)
  local length = size_of.imbalance_shares
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.imbalance_shares(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.imbalance_shares, range, value, display)

  return offset + length, value
end

-- Size: Indicative Clearing Price
size_of.indicative_clearing_price = 8

-- Display: Indicative Clearing Price
display.indicative_clearing_price = function(value)
  return "Indicative Clearing Price: "..value
end

-- Translate: Indicative Clearing Price
translate.indicative_clearing_price = function(raw)
  return raw:tonumber()/10000
end

-- Dissect: Indicative Clearing Price
dissect.indicative_clearing_price = function(buffer, offset, packet, parent)
  local length = size_of.indicative_clearing_price
  local range = buffer(offset, length)
  local raw = range:le_int64()
  local value = translate.indicative_clearing_price(raw)
  local display = display.indicative_clearing_price(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.indicative_clearing_price, range, value, display)

  return offset + length, value
end

-- Size: Reference Price
size_of.reference_price = 8

-- Display: Reference Price
display.reference_price = function(value)
  return "Reference Price: "..value
end

-- Translate: Reference Price
translate.reference_price = function(raw)
  return raw:tonumber()/10000
end

-- Dissect: Reference Price
dissect.reference_price = function(buffer, offset, packet, parent)
  local length = size_of.reference_price
  local range = buffer(offset, length)
  local raw = range:le_int64()
  local value = translate.reference_price(raw)
  local display = display.reference_price(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.reference_price, range, value, display)

  return offset + length, value
end

-- Size: Paired Shares
size_of.paired_shares = 4

-- Display: Paired Shares
display.paired_shares = function(value)
  return "Paired Shares: "..value
end

-- Dissect: Paired Shares
dissect.paired_shares = function(buffer, offset, packet, parent)
  local length = size_of.paired_shares
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.paired_shares(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.paired_shares, range, value, display)

  return offset + length, value
end

-- Size: Symbol
size_of.symbol = 8

-- Display: Symbol
display.symbol = function(value)
  return "Symbol: "..value
end

-- Dissect: Symbol
dissect.symbol = function(buffer, offset, packet, parent)
  local length = size_of.symbol
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.symbol(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.symbol, range, value, display)

  return offset + length, value
end

-- Size: Timestamp
size_of.timestamp = 8

-- Display: Timestamp
display.timestamp = function(value)
  return "Timestamp: "..value
end

-- Dissect: Timestamp
dissect.timestamp = function(buffer, offset, packet, parent)
  local length = size_of.timestamp
  local range = buffer(offset, length)
  local value = range:le_int64()
  local display = display.timestamp(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.timestamp, range, value, display)

  return offset + length, value
end

-- Size: Auction Type
size_of.auction_type = 1

-- Display: Auction Type
display.auction_type = function(value)
  if value == "O" then
    return "Auction Type: Opening Auction (O)"
  end
  if value == "C" then
    return "Auction Type: Closing Auction (C)"
  end
  if value == "I" then
    return "Auction Type: Ipo Auction (I)"
  end
  if value == "H" then
    return "Auction Type: Halt Auction (H)"
  end
  if value == "V" then
    return "Auction Type: Volatility Auction (V)"
  end

  return "Auction Type: Unknown("..value..")"
end

-- Dissect: Auction Type
dissect.auction_type = function(buffer, offset, packet, parent)
  local length = size_of.auction_type
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.auction_type(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.auction_type, range, value, display)

  return offset + length, value
end

-- Calculate size of: Auction Information Message
size_of.auction_information_message = function(buffer, offset)
  local index = 0

  index = index + size_of.auction_type

  index = index + size_of.timestamp

  index = index + size_of.symbol

  index = index + size_of.paired_shares

  index = index + size_of.reference_price

  index = index + size_of.indicative_clearing_price

  index = index + size_of.imbalance_shares

  index = index + size_of.imbalance_side

  index = index + size_of.extension_number

  index = index + size_of.scheduled_auction_time

  index = index + size_of.auction_book_clearing_price

  index = index + size_of.collar_reference_price

  index = index + size_of.lower_auction_collar

  index = index + size_of.upper_auction_collar

  return index
end

-- Display: Auction Information Message
display.auction_information_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Auction Information Message
dissect.auction_information_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Auction Type: 1 Byte Ascii String Enum with 5 values
  index, auction_type = dissect.auction_type(buffer, index, packet, parent)

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Symbol: 8 Byte Ascii String
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  -- Paired Shares: 4 Byte Unsigned Fixed Width Integer
  index, paired_shares = dissect.paired_shares(buffer, index, packet, parent)

  -- Reference Price: 8 Byte Signed Fixed Width Integer
  index, reference_price = dissect.reference_price(buffer, index, packet, parent)

  -- Indicative Clearing Price: 8 Byte Signed Fixed Width Integer
  index, indicative_clearing_price = dissect.indicative_clearing_price(buffer, index, packet, parent)

  -- Imbalance Shares: 4 Byte Unsigned Fixed Width Integer
  index, imbalance_shares = dissect.imbalance_shares(buffer, index, packet, parent)

  -- Imbalance Side: 1 Byte Ascii String Enum with 3 values
  index, imbalance_side = dissect.imbalance_side(buffer, index, packet, parent)

  -- Extension Number: 1 Byte Ascii String
  index, extension_number = dissect.extension_number(buffer, index, packet, parent)

  -- Scheduled Auction Time: 4 Byte Unsigned Fixed Width Integer
  index, scheduled_auction_time = dissect.scheduled_auction_time(buffer, index, packet, parent)

  -- Auction Book Clearing Price: 8 Byte Signed Fixed Width Integer
  index, auction_book_clearing_price = dissect.auction_book_clearing_price(buffer, index, packet, parent)

  -- Collar Reference Price: 8 Byte Signed Fixed Width Integer
  index, collar_reference_price = dissect.collar_reference_price(buffer, index, packet, parent)

  -- Lower Auction Collar: 8 Byte Signed Fixed Width Integer
  index, lower_auction_collar = dissect.lower_auction_collar(buffer, index, packet, parent)

  -- Upper Auction Collar: 8 Byte Signed Fixed Width Integer
  index, upper_auction_collar = dissect.upper_auction_collar(buffer, index, packet, parent)

  return index
end

-- Dissect: Auction Information Message
dissect.auction_information_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.auction_information_message then
    local length = size_of.auction_information_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.auction_information_message(buffer, packet, parent)
    parent = parent:add(iex_equities_deep_iextp_v1_0.fields.auction_information_message, range, display)
  end

  return dissect.auction_information_message_fields(buffer, offset, packet, parent)
end

-- Size: Trade Id
size_of.trade_id = 8

-- Display: Trade Id
display.trade_id = function(value)
  return "Trade Id: "..value
end

-- Dissect: Trade Id
dissect.trade_id = function(buffer, offset, packet, parent)
  local length = size_of.trade_id
  local range = buffer(offset, length)
  local value = range:le_uint64()
  local display = display.trade_id(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.trade_id, range, value, display)

  return offset + length, value
end

-- Size: Price
size_of.price = 8

-- Display: Price
display.price = function(value)
  return "Price: "..value
end

-- Translate: Price
translate.price = function(raw)
  return raw:tonumber()/10000
end

-- Dissect: Price
dissect.price = function(buffer, offset, packet, parent)
  local length = size_of.price
  local range = buffer(offset, length)
  local raw = range:le_int64()
  local value = translate.price(raw)
  local display = display.price(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.price, range, value, display)

  return offset + length, value
end

-- Size: Size
size_of.size = 4

-- Display: Size
display.size = function(value)
  return "Size: "..value
end

-- Dissect: Size
dissect.size = function(buffer, offset, packet, parent)
  local length = size_of.size
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.size(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.size, range, value, display)

  return offset + length, value
end

-- Size: Sale Condition Flags
size_of.sale_condition_flags = 1

-- Display: Sale Condition Flags
display.sale_condition_flags = function(buffer, packet, parent)
  local display = ""

  -- Is Intermarket Sweep flag set?
  if buffer:bitfield(0) > 0 then
    display = display.."Intermarket Sweep|"
  end
  -- Is Extended Hours flag set?
  if buffer:bitfield(1) > 0 then
    display = display.."Extended Hours|"
  end
  -- Is Odd Lot flag set?
  if buffer:bitfield(2) > 0 then
    display = display.."Odd Lot|"
  end
  -- Is Trade Through Exempt flag set?
  if buffer:bitfield(3) > 0 then
    display = display.."Trade Through Exempt|"
  end
  -- Is Singleprice Cross Trade flag set?
  if buffer:bitfield(4) > 0 then
    display = display.."Singleprice Cross Trade|"
  end

  return display:sub(1, -2)
end

-- Dissect Bit Fields: Sale Condition Flags
dissect.sale_condition_flags_bits = function(buffer, offset, packet, parent)

  -- Intermarket Sweep: 1 Bit
  parent:add(iex_equities_deep_iextp_v1_0.fields.intermarket_sweep, buffer(offset, 1))

  -- Extended Hours: 1 Bit
  parent:add(iex_equities_deep_iextp_v1_0.fields.extended_hours, buffer(offset, 1))

  -- Odd Lot: 1 Bit
  parent:add(iex_equities_deep_iextp_v1_0.fields.odd_lot, buffer(offset, 1))

  -- Trade Through Exempt: 1 Bit
  parent:add(iex_equities_deep_iextp_v1_0.fields.trade_through_exempt, buffer(offset, 1))

  -- Singleprice Cross Trade: 1 Bit
  parent:add(iex_equities_deep_iextp_v1_0.fields.singleprice_cross_trade, buffer(offset, 1))

  -- Unused 3: 3 Bit
  parent:add(iex_equities_deep_iextp_v1_0.fields.unused_3, buffer(offset, 1))
end

-- Dissect: Sale Condition Flags
dissect.sale_condition_flags = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local display = display.sale_condition_flags(range, packet, parent)
  local element = parent:add(iex_equities_deep_iextp_v1_0.fields.sale_condition_flags, range, display)

  if show.sale_condition_flags then
    dissect.sale_condition_flags_bits(buffer, offset, packet, element)
  end

  return offset + 1, range
end

-- Calculate size of: Trade Break Message
size_of.trade_break_message = function(buffer, offset)
  local index = 0

  index = index + size_of.sale_condition_flags

  index = index + size_of.timestamp

  index = index + size_of.symbol

  index = index + size_of.size

  index = index + size_of.price

  index = index + size_of.trade_id

  return index
end

-- Display: Trade Break Message
display.trade_break_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Trade Break Message
dissect.trade_break_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sale Condition Flags: 1 Byte Ascii String: Struct of 6 fields
  index, sale_condition_flags = dissect.sale_condition_flags(buffer, index, packet, parent)

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Symbol: 8 Byte Ascii String
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  -- Size: 4 Byte Unsigned Fixed Width Integer
  index, size = dissect.size(buffer, index, packet, parent)

  -- Price: 8 Byte Signed Fixed Width Integer
  index, price = dissect.price(buffer, index, packet, parent)

  -- Trade Id: 8 Byte Unsigned Fixed Width Integer
  index, trade_id = dissect.trade_id(buffer, index, packet, parent)

  return index
end

-- Dissect: Trade Break Message
dissect.trade_break_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.trade_break_message then
    local length = size_of.trade_break_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.trade_break_message(buffer, packet, parent)
    parent = parent:add(iex_equities_deep_iextp_v1_0.fields.trade_break_message, range, display)
  end

  return dissect.trade_break_message_fields(buffer, offset, packet, parent)
end

-- Size: Official Price
size_of.official_price = 8

-- Display: Official Price
display.official_price = function(value)
  return "Official Price: "..value
end

-- Translate: Official Price
translate.official_price = function(raw)
  return raw:tonumber()/10000
end

-- Dissect: Official Price
dissect.official_price = function(buffer, offset, packet, parent)
  local length = size_of.official_price
  local range = buffer(offset, length)
  local raw = range:le_int64()
  local value = translate.official_price(raw)
  local display = display.official_price(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.official_price, range, value, display)

  return offset + length, value
end

-- Size: Price Type
size_of.price_type = 1

-- Display: Price Type
display.price_type = function(value)
  if value == "Q" then
    return "Price Type: Iex Official Opening Price (Q)"
  end
  if value == "M" then
    return "Price Type: Iex Official Closing Price (M)"
  end

  return "Price Type: Unknown("..value..")"
end

-- Dissect: Price Type
dissect.price_type = function(buffer, offset, packet, parent)
  local length = size_of.price_type
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.price_type(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.price_type, range, value, display)

  return offset + length, value
end

-- Calculate size of: Official Price Message
size_of.official_price_message = function(buffer, offset)
  local index = 0

  index = index + size_of.price_type

  index = index + size_of.timestamp

  index = index + size_of.symbol

  index = index + size_of.official_price

  return index
end

-- Display: Official Price Message
display.official_price_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Official Price Message
dissect.official_price_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Price Type: 1 Byte Ascii String Enum with 2 values
  index, price_type = dissect.price_type(buffer, index, packet, parent)

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Symbol: 8 Byte Ascii String
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  -- Official Price: 8 Byte Signed Fixed Width Integer
  index, official_price = dissect.official_price(buffer, index, packet, parent)

  return index
end

-- Dissect: Official Price Message
dissect.official_price_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.official_price_message then
    local length = size_of.official_price_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.official_price_message(buffer, packet, parent)
    parent = parent:add(iex_equities_deep_iextp_v1_0.fields.official_price_message, range, display)
  end

  return dissect.official_price_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Trade Report Message
size_of.trade_report_message = function(buffer, offset)
  local index = 0

  index = index + size_of.sale_condition_flags

  index = index + size_of.timestamp

  index = index + size_of.symbol

  index = index + size_of.size

  index = index + size_of.price

  index = index + size_of.trade_id

  return index
end

-- Display: Trade Report Message
display.trade_report_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Trade Report Message
dissect.trade_report_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Sale Condition Flags: 1 Byte Ascii String: Struct of 6 fields
  index, sale_condition_flags = dissect.sale_condition_flags(buffer, index, packet, parent)

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Symbol: 8 Byte Ascii String
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  -- Size: 4 Byte Unsigned Fixed Width Integer
  index, size = dissect.size(buffer, index, packet, parent)

  -- Price: 8 Byte Signed Fixed Width Integer
  index, price = dissect.price(buffer, index, packet, parent)

  -- Trade Id: 8 Byte Unsigned Fixed Width Integer
  index, trade_id = dissect.trade_id(buffer, index, packet, parent)

  return index
end

-- Dissect: Trade Report Message
dissect.trade_report_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.trade_report_message then
    local length = size_of.trade_report_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.trade_report_message(buffer, packet, parent)
    parent = parent:add(iex_equities_deep_iextp_v1_0.fields.trade_report_message, range, display)
  end

  return dissect.trade_report_message_fields(buffer, offset, packet, parent)
end

-- Size: Event Flags
size_of.event_flags = 1

-- Display: Event Flags
display.event_flags = function(value)
  if value == 0 then
    return "Event Flags: Order Book Is Processing An Event (0)"
  end
  if value == 1 then
    return "Event Flags: Event Processing Complete (1)"
  end

  return "Event Flags: Unknown("..value..")"
end

-- Dissect: Event Flags
dissect.event_flags = function(buffer, offset, packet, parent)
  local length = size_of.event_flags
  local range = buffer(offset, length)
  local value = range:uint()
  local display = display.event_flags(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.event_flags, range, value, display)

  return offset + length, value
end

-- Calculate size of: Price Level Sell Update Message
size_of.price_level_sell_update_message = function(buffer, offset)
  local index = 0

  index = index + size_of.event_flags

  index = index + size_of.timestamp

  index = index + size_of.symbol

  index = index + size_of.size

  index = index + size_of.price

  return index
end

-- Display: Price Level Sell Update Message
display.price_level_sell_update_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Price Level Sell Update Message
dissect.price_level_sell_update_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Event Flags: 1 Byte Unsigned Fixed Width Integer Enum with 2 values
  index, event_flags = dissect.event_flags(buffer, index, packet, parent)

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Symbol: 8 Byte Ascii String
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  -- Size: 4 Byte Unsigned Fixed Width Integer
  index, size = dissect.size(buffer, index, packet, parent)

  -- Price: 8 Byte Signed Fixed Width Integer
  index, price = dissect.price(buffer, index, packet, parent)

  return index
end

-- Dissect: Price Level Sell Update Message
dissect.price_level_sell_update_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.price_level_sell_update_message then
    local length = size_of.price_level_sell_update_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.price_level_sell_update_message(buffer, packet, parent)
    parent = parent:add(iex_equities_deep_iextp_v1_0.fields.price_level_sell_update_message, range, display)
  end

  return dissect.price_level_sell_update_message_fields(buffer, offset, packet, parent)
end

-- Calculate size of: Price Level Buy Update Message
size_of.price_level_buy_update_message = function(buffer, offset)
  local index = 0

  index = index + size_of.event_flags

  index = index + size_of.timestamp

  index = index + size_of.symbol

  index = index + size_of.size

  index = index + size_of.price

  return index
end

-- Display: Price Level Buy Update Message
display.price_level_buy_update_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Price Level Buy Update Message
dissect.price_level_buy_update_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Event Flags: 1 Byte Unsigned Fixed Width Integer Enum with 2 values
  index, event_flags = dissect.event_flags(buffer, index, packet, parent)

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Symbol: 8 Byte Ascii String
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  -- Size: 4 Byte Unsigned Fixed Width Integer
  index, size = dissect.size(buffer, index, packet, parent)

  -- Price: 8 Byte Signed Fixed Width Integer
  index, price = dissect.price(buffer, index, packet, parent)

  return index
end

-- Dissect: Price Level Buy Update Message
dissect.price_level_buy_update_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.price_level_buy_update_message then
    local length = size_of.price_level_buy_update_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.price_level_buy_update_message(buffer, packet, parent)
    parent = parent:add(iex_equities_deep_iextp_v1_0.fields.price_level_buy_update_message, range, display)
  end

  return dissect.price_level_buy_update_message_fields(buffer, offset, packet, parent)
end

-- Size: Security Event
size_of.security_event = 1

-- Display: Security Event
display.security_event = function(value)
  if value == "O" then
    return "Security Event: Opening Process Complete (O)"
  end
  if value == "C" then
    return "Security Event: Closing Process Complete (C)"
  end

  return "Security Event: Unknown("..value..")"
end

-- Dissect: Security Event
dissect.security_event = function(buffer, offset, packet, parent)
  local length = size_of.security_event
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.security_event(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.security_event, range, value, display)

  return offset + length, value
end

-- Calculate size of: Security Event Message
size_of.security_event_message = function(buffer, offset)
  local index = 0

  index = index + size_of.security_event

  index = index + size_of.timestamp

  index = index + size_of.symbol

  return index
end

-- Display: Security Event Message
display.security_event_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Security Event Message
dissect.security_event_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Security Event: 1 Byte Ascii String Enum with 2 values
  index, security_event = dissect.security_event(buffer, index, packet, parent)

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Symbol: 8 Byte Ascii String
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  return index
end

-- Dissect: Security Event Message
dissect.security_event_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.security_event_message then
    local length = size_of.security_event_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.security_event_message(buffer, packet, parent)
    parent = parent:add(iex_equities_deep_iextp_v1_0.fields.security_event_message, range, display)
  end

  return dissect.security_event_message_fields(buffer, offset, packet, parent)
end

-- Size: Detail
size_of.detail = 1

-- Display: Detail
display.detail = function(value)
  if value == " " then
    return "Detail: No Price Test In Place (<whitespace>)"
  end
  if value == "A" then
    return "Detail: Short Sale Price Test Restriction In Effect Due To An Intraday Price Drop In The Security (A)"
  end
  if value == "C" then
    return "Detail: Short Sale Price Test Restriction Remains In Effect From Prior Day (C)"
  end
  if value == "D" then
    return "Detail: Short Sale Price Test Restriction Deactivated (D)"
  end
  if value == "N" then
    return "Detail: Detail Not Available (N)"
  end

  return "Detail: Unknown("..value..")"
end

-- Dissect: Detail
dissect.detail = function(buffer, offset, packet, parent)
  local length = size_of.detail
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.detail(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.detail, range, value, display)

  return offset + length, value
end

-- Size: Short Sale Price Test Status
size_of.short_sale_price_test_status = 1

-- Display: Short Sale Price Test Status
display.short_sale_price_test_status = function(value)
  if value == 0 then
    return "Short Sale Price Test Status: Not In Effect (0)"
  end
  if value == 1 then
    return "Short Sale Price Test Status: In Effect (1)"
  end

  return "Short Sale Price Test Status: Unknown("..value..")"
end

-- Dissect: Short Sale Price Test Status
dissect.short_sale_price_test_status = function(buffer, offset, packet, parent)
  local length = size_of.short_sale_price_test_status
  local range = buffer(offset, length)
  local value = range:uint()
  local display = display.short_sale_price_test_status(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.short_sale_price_test_status, range, value, display)

  return offset + length, value
end

-- Calculate size of: Short Sale Price Test Status Message
size_of.short_sale_price_test_status_message = function(buffer, offset)
  local index = 0

  index = index + size_of.short_sale_price_test_status

  index = index + size_of.timestamp

  index = index + size_of.symbol

  index = index + size_of.detail

  return index
end

-- Display: Short Sale Price Test Status Message
display.short_sale_price_test_status_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Short Sale Price Test Status Message
dissect.short_sale_price_test_status_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Short Sale Price Test Status: 1 Byte Unsigned Fixed Width Integer Enum with 2 values
  index, short_sale_price_test_status = dissect.short_sale_price_test_status(buffer, index, packet, parent)

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Symbol: 8 Byte Ascii String
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  -- Detail: 1 Byte Ascii String Enum with 5 values
  index, detail = dissect.detail(buffer, index, packet, parent)

  return index
end

-- Dissect: Short Sale Price Test Status Message
dissect.short_sale_price_test_status_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.short_sale_price_test_status_message then
    local length = size_of.short_sale_price_test_status_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.short_sale_price_test_status_message(buffer, packet, parent)
    parent = parent:add(iex_equities_deep_iextp_v1_0.fields.short_sale_price_test_status_message, range, display)
  end

  return dissect.short_sale_price_test_status_message_fields(buffer, offset, packet, parent)
end

-- Size: Operational Halt Status
size_of.operational_halt_status = 1

-- Display: Operational Halt Status
display.operational_halt_status = function(value)
  if value == "O" then
    return "Operational Halt Status: Iex Specific Operational Trading Halt (O)"
  end
  if value == "N" then
    return "Operational Halt Status: Not Operationally Halted On Iex (N)"
  end

  return "Operational Halt Status: Unknown("..value..")"
end

-- Dissect: Operational Halt Status
dissect.operational_halt_status = function(buffer, offset, packet, parent)
  local length = size_of.operational_halt_status
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.operational_halt_status(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.operational_halt_status, range, value, display)

  return offset + length, value
end

-- Calculate size of: Operational Halt Status Message
size_of.operational_halt_status_message = function(buffer, offset)
  local index = 0

  index = index + size_of.operational_halt_status

  index = index + size_of.timestamp

  index = index + size_of.symbol

  return index
end

-- Display: Operational Halt Status Message
display.operational_halt_status_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Operational Halt Status Message
dissect.operational_halt_status_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Operational Halt Status: 1 Byte Ascii String Enum with 2 values
  index, operational_halt_status = dissect.operational_halt_status(buffer, index, packet, parent)

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Symbol: 8 Byte Ascii String
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  return index
end

-- Dissect: Operational Halt Status Message
dissect.operational_halt_status_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.operational_halt_status_message then
    local length = size_of.operational_halt_status_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.operational_halt_status_message(buffer, packet, parent)
    parent = parent:add(iex_equities_deep_iextp_v1_0.fields.operational_halt_status_message, range, display)
  end

  return dissect.operational_halt_status_message_fields(buffer, offset, packet, parent)
end

-- Size: Reason
size_of.reason = 4

-- Display: Reason
display.reason = function(value)
  return "Reason: "..value
end

-- Dissect: Reason
dissect.reason = function(buffer, offset, packet, parent)
  local length = size_of.reason
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.reason(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.reason, range, value, display)

  return offset + length, value
end

-- Size: Trading Status
size_of.trading_status = 1

-- Display: Trading Status
display.trading_status = function(value)
  if value == "H" then
    return "Trading Status: Trading Halted Across All Us Equity Markets (H)"
  end
  if value == "P" then
    return "Trading Status: Trading Paused And Order Acceptance Period On Iex (P)"
  end
  if value == "T" then
    return "Trading Status: Trading On Iex (T)"
  end

  return "Trading Status: Unknown("..value..")"
end

-- Dissect: Trading Status
dissect.trading_status = function(buffer, offset, packet, parent)
  local length = size_of.trading_status
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.trading_status(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.trading_status, range, value, display)

  return offset + length, value
end

-- Calculate size of: Trading Status Message
size_of.trading_status_message = function(buffer, offset)
  local index = 0

  index = index + size_of.trading_status

  index = index + size_of.timestamp

  index = index + size_of.symbol

  index = index + size_of.reason

  return index
end

-- Display: Trading Status Message
display.trading_status_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Trading Status Message
dissect.trading_status_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Trading Status: 1 Byte Ascii String Enum with 3 values
  index, trading_status = dissect.trading_status(buffer, index, packet, parent)

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Symbol: 8 Byte Ascii String
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  -- Reason: 4 Byte Ascii String
  index, reason = dissect.reason(buffer, index, packet, parent)

  return index
end

-- Dissect: Trading Status Message
dissect.trading_status_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.trading_status_message then
    local length = size_of.trading_status_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.trading_status_message(buffer, packet, parent)
    parent = parent:add(iex_equities_deep_iextp_v1_0.fields.trading_status_message, range, display)
  end

  return dissect.trading_status_message_fields(buffer, offset, packet, parent)
end

-- Size: Luld Tier
size_of.luld_tier = 1

-- Display: Luld Tier
display.luld_tier = function(value)
  if value == 0 then
    return "Luld Tier: Not Applicable (0)"
  end
  if value == 1 then
    return "Luld Tier: Tier 1 Nms Stock (1)"
  end
  if value == 2 then
    return "Luld Tier: Tier 2 Nms Stock (2)"
  end

  return "Luld Tier: Unknown("..value..")"
end

-- Dissect: Luld Tier
dissect.luld_tier = function(buffer, offset, packet, parent)
  local length = size_of.luld_tier
  local range = buffer(offset, length)
  local value = range:uint()
  local display = display.luld_tier(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.luld_tier, range, value, display)

  return offset + length, value
end

-- Size: Adjusted Poc Price
size_of.adjusted_poc_price = 8

-- Display: Adjusted Poc Price
display.adjusted_poc_price = function(value)
  return "Adjusted Poc Price: "..value
end

-- Translate: Adjusted Poc Price
translate.adjusted_poc_price = function(raw)
  return raw:tonumber()/10000
end

-- Dissect: Adjusted Poc Price
dissect.adjusted_poc_price = function(buffer, offset, packet, parent)
  local length = size_of.adjusted_poc_price
  local range = buffer(offset, length)
  local raw = range:le_int64()
  local value = translate.adjusted_poc_price(raw)
  local display = display.adjusted_poc_price(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.adjusted_poc_price, range, value, display)

  return offset + length, value
end

-- Size: Round Lot Size
size_of.round_lot_size = 4

-- Display: Round Lot Size
display.round_lot_size = function(value)
  return "Round Lot Size: "..value
end

-- Dissect: Round Lot Size
dissect.round_lot_size = function(buffer, offset, packet, parent)
  local length = size_of.round_lot_size
  local range = buffer(offset, length)
  local value = range:le_uint()
  local display = display.round_lot_size(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.round_lot_size, range, value, display)

  return offset + length, value
end

-- Size: Security Directory Flags
size_of.security_directory_flags = 1

-- Display: Security Directory Flags
display.security_directory_flags = function(buffer, packet, parent)
  local display = ""

  -- Is Etp flag set?
  if buffer:bitfield(0) > 0 then
    display = display.."Etp|"
  end
  -- Is When Issued flag set?
  if buffer:bitfield(1) > 0 then
    display = display.."When Issued|"
  end
  -- Is Test Security flag set?
  if buffer:bitfield(2) > 0 then
    display = display.."Test Security|"
  end

  return display:sub(1, -2)
end

-- Dissect Bit Fields: Security Directory Flags
dissect.security_directory_flags_bits = function(buffer, offset, packet, parent)

  -- Etp: 1 Bit
  parent:add(iex_equities_deep_iextp_v1_0.fields.etp, buffer(offset, 1))

  -- When Issued: 1 Bit
  parent:add(iex_equities_deep_iextp_v1_0.fields.when_issued, buffer(offset, 1))

  -- Test Security: 1 Bit
  parent:add(iex_equities_deep_iextp_v1_0.fields.test_security, buffer(offset, 1))

  -- Unused 5: 5 Bit
  parent:add(iex_equities_deep_iextp_v1_0.fields.unused_5, buffer(offset, 1))
end

-- Dissect: Security Directory Flags
dissect.security_directory_flags = function(buffer, offset, packet, parent)
  local size = 1
  local range = buffer(offset, size)
  local display = display.security_directory_flags(range, packet, parent)
  local element = parent:add(iex_equities_deep_iextp_v1_0.fields.security_directory_flags, range, display)

  if show.security_directory_flags then
    dissect.security_directory_flags_bits(buffer, offset, packet, element)
  end

  return offset + 1, range
end

-- Calculate size of: Security Directory Message
size_of.security_directory_message = function(buffer, offset)
  local index = 0

  index = index + size_of.security_directory_flags

  index = index + size_of.timestamp

  index = index + size_of.symbol

  index = index + size_of.round_lot_size

  index = index + size_of.adjusted_poc_price

  index = index + size_of.luld_tier

  return index
end

-- Display: Security Directory Message
display.security_directory_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: Security Directory Message
dissect.security_directory_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- Security Directory Flags: Struct of 4 fields
  index, security_directory_flags = dissect.security_directory_flags(buffer, index, packet, parent)

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  -- Symbol: 8 Byte Ascii String
  index, symbol = dissect.symbol(buffer, index, packet, parent)

  -- Round Lot Size: 4 Byte Unsigned Fixed Width Integer
  index, round_lot_size = dissect.round_lot_size(buffer, index, packet, parent)

  -- Adjusted Poc Price: 8 Byte Signed Fixed Width Integer
  index, adjusted_poc_price = dissect.adjusted_poc_price(buffer, index, packet, parent)

  -- Luld Tier: 1 Byte Unsigned Fixed Width Integer Enum with 3 values
  index, luld_tier = dissect.luld_tier(buffer, index, packet, parent)

  return index
end

-- Dissect: Security Directory Message
dissect.security_directory_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.security_directory_message then
    local length = size_of.security_directory_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.security_directory_message(buffer, packet, parent)
    parent = parent:add(iex_equities_deep_iextp_v1_0.fields.security_directory_message, range, display)
  end

  return dissect.security_directory_message_fields(buffer, offset, packet, parent)
end

-- Size: System Event
size_of.system_event = 1

-- Display: System Event
display.system_event = function(value)
  if value == "S" then
    return "System Event: Start Of System Hours (S)"
  end
  if value == "R" then
    return "System Event: Start Of Regular Market Hours (R)"
  end
  if value == "M" then
    return "System Event: End Of Regular Market Hours (M)"
  end
  if value == "E" then
    return "System Event: End Of System Hours (E)"
  end

  return "System Event: Unknown("..value..")"
end

-- Dissect: System Event
dissect.system_event = function(buffer, offset, packet, parent)
  local length = size_of.system_event
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.system_event(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.system_event, range, value, display)

  return offset + length, value
end

-- Calculate size of: System Event Message
size_of.system_event_message = function(buffer, offset)
  local index = 0

  index = index + size_of.system_event

  index = index + size_of.timestamp

  return index
end

-- Display: System Event Message
display.system_event_message = function(buffer, offset, size, packet, parent)
  return ""
end

-- Dissect Fields: System Event Message
dissect.system_event_message_fields = function(buffer, offset, packet, parent)
  local index = offset

  -- System Event: 1 Byte Ascii String Enum with 4 values
  index, system_event = dissect.system_event(buffer, index, packet, parent)

  -- Timestamp: 8 Byte Signed Fixed Width Integer
  index, timestamp = dissect.timestamp(buffer, index, packet, parent)

  return index
end

-- Dissect: System Event Message
dissect.system_event_message = function(buffer, offset, packet, parent)
  -- Optionally add struct element to protocol tree
  if show.system_event_message then
    local length = size_of.system_event_message(buffer, offset)
    local range = buffer(offset, length)
    local display = display.system_event_message(buffer, packet, parent)
    parent = parent:add(iex_equities_deep_iextp_v1_0.fields.system_event_message, range, display)
  end

  return dissect.system_event_message_fields(buffer, offset, packet, parent)
end

-- Calculate runtime size of: Message Data
size_of.message_data = function(buffer, offset, message_type)
  -- Size of System Event Message
  if message_type == "S" then
    return size_of.system_event_message(buffer, offset)
  end
  -- Size of Security Directory Message
  if message_type == "D" then
    return size_of.security_directory_message(buffer, offset)
  end
  -- Size of Trading Status Message
  if message_type == "H" then
    return size_of.trading_status_message(buffer, offset)
  end
  -- Size of Operational Halt Status Message
  if message_type == "O" then
    return size_of.operational_halt_status_message(buffer, offset)
  end
  -- Size of Short Sale Price Test Status Message
  if message_type == "P" then
    return size_of.short_sale_price_test_status_message(buffer, offset)
  end
  -- Size of Security Event Message
  if message_type == "E" then
    return size_of.security_event_message(buffer, offset)
  end
  -- Size of Price Level Buy Update Message
  if message_type == "8" then
    return size_of.price_level_buy_update_message(buffer, offset)
  end
  -- Size of Price Level Sell Update Message
  if message_type == "5" then
    return size_of.price_level_sell_update_message(buffer, offset)
  end
  -- Size of Trade Report Message
  if message_type == "T" then
    return size_of.trade_report_message(buffer, offset)
  end
  -- Size of Official Price Message
  if message_type == "X" then
    return size_of.official_price_message(buffer, offset)
  end
  -- Size of Trade Break Message
  if message_type == "B" then
    return size_of.trade_break_message(buffer, offset)
  end
  -- Size of Auction Information Message
  if message_type == "A" then
    return size_of.auction_information_message(buffer, offset)
  end

  return 0
end

-- Display: Message Data
display.message_data = function(buffer, offset, packet, parent)
  return ""
end

-- Dissect Branches: Message Data
dissect.message_data_branches = function(buffer, offset, packet, parent, message_type)
  -- Dissect System Event Message
  if message_type == "S" then
    return dissect.system_event_message(buffer, offset, packet, parent)
  end
  -- Dissect Security Directory Message
  if message_type == "D" then
    return dissect.security_directory_message(buffer, offset, packet, parent)
  end
  -- Dissect Trading Status Message
  if message_type == "H" then
    return dissect.trading_status_message(buffer, offset, packet, parent)
  end
  -- Dissect Operational Halt Status Message
  if message_type == "O" then
    return dissect.operational_halt_status_message(buffer, offset, packet, parent)
  end
  -- Dissect Short Sale Price Test Status Message
  if message_type == "P" then
    return dissect.short_sale_price_test_status_message(buffer, offset, packet, parent)
  end
  -- Dissect Security Event Message
  if message_type == "E" then
    return dissect.security_event_message(buffer, offset, packet, parent)
  end
  -- Dissect Price Level Buy Update Message
  if message_type == "8" then
    return dissect.price_level_buy_update_message(buffer, offset, packet, parent)
  end
  -- Dissect Price Level Sell Update Message
  if message_type == "5" then
    return dissect.price_level_sell_update_message(buffer, offset, packet, parent)
  end
  -- Dissect Trade Report Message
  if message_type == "T" then
    return dissect.trade_report_message(buffer, offset, packet, parent)
  end
  -- Dissect Official Price Message
  if message_type == "X" then
    return dissect.official_price_message(buffer, offset, packet, parent)
  end
  -- Dissect Trade Break Message
  if message_type == "B" then
    return dissect.trade_break_message(buffer, offset, packet, parent)
  end
  -- Dissect Auction Information Message
  if message_type == "A" then
    return dissect.auction_information_message(buffer, offset, packet, parent)
  end

  return offset
end

-- Dissect: Message Data
dissect.message_data = function(buffer, offset, packet, parent, message_type)
  if not show.message_data then
    return dissect.message_data_branches(buffer, offset, packet, parent, message_type)
  end

  -- Calculate size and check that branch is not empty
  local size = size_of.message_data(buffer, offset, message_type)
  if size == 0 then
    return offset
  end

  -- Dissect Element
  local range = buffer(offset, size)
  local display = display.message_data(buffer, packet, parent)
  local element = parent:add(iex_equities_deep_iextp_v1_0.fields.message_data, range, display)

  return dissect.message_data_branches(buffer, offset, packet, parent, message_type)
end

-- Size: Message Type
size_of.message_type = 1

-- Display: Message Type
display.message_type = function(value)
  if value == "S" then
    return "Message Type: System Event Message (S)"
  end
  if value == "D" then
    return "Message Type: Security Directory Message (D)"
  end
  if value == "H" then
    return "Message Type: Trading Status Message (H)"
  end
  if value == "O" then
    return "Message Type: Operational Halt Status Message (O)"
  end
  if value == "P" then
    return "Message Type: Short Sale Price Test Status Message (P)"
  end
  if value == "E" then
    return "Message Type: Security Event Message (E)"
  end
  if value == "8" then
    return "Message Type: Price Level Buy Update Message (8)"
  end
  if value == "5" then
    return "Message Type: Price Level Sell Update Message (5)"
  end
  if value == "T" then
    return "Message Type: Trade Report Message (T)"
  end
  if value == "X" then
    return "Message Type: Official Price Message (X)"
  end
  if value == "B" then
    return "Message Type: Trade Break Message (B)"
  end
  if value == "A" then
    return "Message Type: Auction Information Message (A)"
  end

  return "Message Type: Unknown("..value..")"
end

-- Dissect: Message Type
dissect.message_type = function(buffer, offset, packet, parent)
  local length = size_of.message_type
  local range = buffer(offset, length)
  local value = range:string()
  local display = display.message_type(value, buffer, offset, packet, parent)

  parent:add(iex_equities_deep_iextp_v1_0.fields.message_type, range, value, display)

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

  parent:add(iex_equities_deep_iextp_v1_0.fields.message_length, range, value, display)

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

  -- Message Type: 1 Byte Ascii String Enum with 12 values
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
    parent = parent:add(iex_equities_deep_iextp_v1_0.fields.message_header, range, display)
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

  -- Dependency element: Message Type
  local message_type = buffer(index - 1, 1):string()

  -- Message Data: Runtime Type with 12 branches
  index = dissect.message_data(buffer, index, packet, parent, message_type)

  return index
end

-- Dissect: Message
dissect.message = function(buffer, offset, packet, parent, size_of_message)
  -- Optionally add struct element to protocol tree
  if show.message then
    local range = buffer(offset, size_of_message)
    local display = display.message(buffer, packet, parent)
    parent = parent:add(iex_equities_deep_iextp_v1_0.fields.message, range, display)
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

  parent:add(iex_equities_deep_iextp_v1_0.fields.send_time, range, value, display)

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

  parent:add(iex_equities_deep_iextp_v1_0.fields.first_message_sequence_number, range, value, display)

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

  parent:add(iex_equities_deep_iextp_v1_0.fields.stream_offset, range, value, display)

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

  parent:add(iex_equities_deep_iextp_v1_0.fields.message_count, range, value, display)

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

  parent:add(iex_equities_deep_iextp_v1_0.fields.payload_length, range, value, display)

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

  parent:add(iex_equities_deep_iextp_v1_0.fields.session_id, range, value, display)

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

  parent:add(iex_equities_deep_iextp_v1_0.fields.channel_id, range, value, display)

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

  parent:add(iex_equities_deep_iextp_v1_0.fields.message_protocol_id, range, value, display)

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

  parent:add(iex_equities_deep_iextp_v1_0.fields.reserved, range, value, display)

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

  parent:add(iex_equities_deep_iextp_v1_0.fields.version, range, value, display)

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
    parent = parent:add(iex_equities_deep_iextp_v1_0.fields.iex_tp_header, range, display)
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
function iex_equities_deep_iextp_v1_0.init()
end

-- Dissector for Iex Equities Deep IexTp 1.0
function iex_equities_deep_iextp_v1_0.dissector(buffer, packet, parent)

  -- Set protocol name
  packet.cols.protocol = iex_equities_deep_iextp_v1_0.name

  -- Dissect protocol
  local protocol = parent:add(iex_equities_deep_iextp_v1_0, buffer(), iex_equities_deep_iextp_v1_0.description, "("..buffer:len().." Bytes)")
  return dissect.packet(buffer, packet, protocol)
end

-- Register With Udp Table
local udp_table = DissectorTable.get("udp.port")
udp_table:add(65333, iex_equities_deep_iextp_v1_0)


-----------------------------------------------------------------------
-- Protocol Heuristics
-----------------------------------------------------------------------

-- Verify size of packet
verify.iex_equities_deep_iextp_v1_0_packet_size = function(buffer)

  return true
end

-- Dissector Heuristic for Iex Equities Deep IexTp 1.0
local function iex_equities_deep_iextp_v1_0_heuristic(buffer, packet, parent)
  -- Verify packet length
  if not verify.iex_equities_deep_iextp_v1_0_packet_size(buffer) then return false end

  -- Protocol is valid, set conversation and dissect this packet
  packet.conversation = iex_equities_deep_iextp_v1_0
  iex_equities_deep_iextp_v1_0.dissector(buffer, packet, parent)

  return true
end

-- Register Heuristic for Iex Equities Deep IexTp 1.0
iex_equities_deep_iextp_v1_0:register_heuristic("udp", iex_equities_deep_iextp_v1_0_heuristic)

-----------------------------------------------------------------------
-- Lua dissectors are an easily edited and modified cross platform dissection solution.
-- Feel free to modify. Enjoy.
-----------------------------------------------------------------------
-- 
-- Protocol:
--   Organization: Investors Exchange
--   Version: 1.0
--   Date: Tuesday, February 27, 2018
--   Specification: IEX DEEP Specification.pdf
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
