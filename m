Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AF02139DD;
	Tue, 18 Jun 2024 17:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718731588; cv=fail; b=Q5yEZQ/nguk0Ws0ab6HAyB4LYrfY8DwkUVdWwWTo++k+ThSxpprHBJM21cx81XYgWRN5A3n0WNgQNfTMz6P0TNGbiilzbTdgly1Lt9mqEUY1+wxxAF60+iifP1X5fbS017a7V9wir64axHbO1XObFwZEwZQTfUdn729g3g4ca7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718731588; c=relaxed/simple;
	bh=GSggcoyShBOLAPob9e+inVblG6lH7wuETkAFIcf/qQA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cxb0aG0/GMSdTDoLrFCk5tVz35aNORZKMvQbbNzNk45dn40ZIHgAkg9y6QYWdsPEoFrS4TZH+YulMd+XH4/24V/yzexW96Y8Y//Tx74QR4/PYxD9semouSt8q8/yquovxiFtnHYt6g3dyjXBBT6exdvAKQ/8Bg8sULWcIkNo3Fw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yzuwgaOD; arc=fail smtp.client-ip=40.107.244.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yzuwgaOD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnCn4JGPLMQpGyzmEqzu9dXZ0Rjiu5UOLoqfn0VxyhrmH/RTDSp8yFJ2IlISreM+sIO5bNfigb1f1AOY0HWgVKSJbcPmVOzxmS3KrOXMaB3d6sT8/bJjqBU+im4ucSK+OoB5n3PW58034mZlb5CZabbXMqEDOahvnyiAVg7XDodOwP3C2r7kp06Iv3QjMRKW+kdx9o5BmaOwD2CF0ZIAkqDUPfxTmX3OtX+Wj+fcrlYlhwpEGa2HK95QuYn15fIfyA1bMqt7xEITPYEd6QPjWroHyjWvhG4CiP6qDKru21km2hpF1Q/NAFxQNjb5MI9Bwwatm7DeEPNFAh0qF6wnkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Er7O4xDlhkI0jxUHaZmmLNXZz2dmKze8UyLdhYnOiGk=;
 b=jaq3gbqkN3VMy72T29ipt6Sn3wzkc6zKeHm5vwOP9QGqpJHguexSy9X3W/UIPMe8A5ocfgEQlKEdbPiJrwnNFhldoiDSdT0/Ndfa5KQiJPQQCiaC4u1IMot5xS56OnVupYyA8ngVbviUqpn++QEHmD11F55wd7WDp7VgUixW8M4UvdjJQxch6nVpRNzRV3x9uAMuI4FRHEcKu6DM5tMfuLWDYk/niYtxVGB3+Czcwa6uh3UHjtQlYtJDb0eoJE2OJrADNrreTqGQMRrHeLiatT0txy4+DCmIlPitdwm/ttWvSrXK5hVnIJb780eyoddvETPlRJbN4OYEuoErrHbmMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Er7O4xDlhkI0jxUHaZmmLNXZz2dmKze8UyLdhYnOiGk=;
 b=yzuwgaOD0wumokcxmk8qQ9pbubK1tMFdNYR86GoxZoKOV8gMjY3nVo06AcvuhVnXo77yzESxEWVOSoXbU5H8S2ri4mRGWwB2f6RaxfcsuZ1aTUl7qaiyFU+GYViC59ak8IPk7wdfg9klAm4l6e5C9JYYzLVtK+yVYwMUZP6Qihs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17)
 by BY1PR12MB8445.namprd12.prod.outlook.com (2603:10b6:a03:523::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 18 Jun
 2024 17:26:22 +0000
Received: from BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::5a16:a4db:8bed:1f5d]) by BL1PR12MB5874.namprd12.prod.outlook.com
 ([fe80::5a16:a4db:8bed:1f5d%5]) with mapi id 15.20.7698.017; Tue, 18 Jun 2024
 17:26:21 +0000
Message-ID: <c3f64b43-1ba2-4865-9836-5ba4a32c2c8f@amd.com>
Date: Tue, 18 Jun 2024 12:26:19 -0500
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v5] remoteproc: xlnx: add attach detach support
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: "andersson@kernel.org" <andersson@kernel.org>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20240610154227.3104790-1-tanmay.shah@amd.com>
 <ZnBY0UtG9fyfxdTh@p14s> <f51ec569-195a-4434-8f3e-36401aabef89@amd.com>
 <ZnG77WlE4o/rxebU@p14s>
Content-Language: en-US
From: Tanmay Shah <tanmay.shah@amd.com>
In-Reply-To: <ZnG77WlE4o/rxebU@p14s>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0024.namprd04.prod.outlook.com
 (2603:10b6:806:f2::29) To BL1PR12MB5874.namprd12.prod.outlook.com
 (2603:10b6:208:396::17)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5874:EE_|BY1PR12MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: 442f678e-0c3f-4656-d31d-08dc8fbbc598
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|366013|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R3VhSnV0czFqanVyWGRVQ1FvdGNUQ0Znb0hML0pzdmpja2FxK3hQSnR0eHZW?=
 =?utf-8?B?WTdDbThQenBhOE55Mjg5ckRRZk9qMytEV0I3SUIwY0VYMHFQUDNJWVVkMFdp?=
 =?utf-8?B?Uk9nU0ZmRFJaQi8vbUhDaVMwZjB1ZGVRcWNqc0kvaVZEblJTUUZiZk43TUZC?=
 =?utf-8?B?Yi95ZlkyWHpNTFpvY0YvVmN0M3lNeStndHFrb0RjOWhLdGxRejIvOEdXYUpF?=
 =?utf-8?B?S2NWUUdTS2l6TnpBNlNNVDlIamtZaGUyeHkrWTNmVDFXeHlYSXYyT04xdDFL?=
 =?utf-8?B?TW12NWt3WFlCeDM2M0hEMlpmcDVLaFR5Qk5OUWIrOGpkak0za0Nna2dyRm5H?=
 =?utf-8?B?UmhrbFNsTmpVdS9MbWZjUHh1TjFnT1Q3eE5pUE5KZ0pVbE1tQi9PL2xabCsw?=
 =?utf-8?B?Qk9NbWhIaHd6Y2FVYllzMFAvckMxeThpdlVNNzNQbTJqYi9qeUlpeVJFWFYw?=
 =?utf-8?B?NWYrZmpjSTFSQU5iVGtET3JKbGFMUys2U1hNbkZITG1aejYyL1AvajRGb200?=
 =?utf-8?B?YnE3WHUzbjdJQ0VsZFc1d091RkIxdE1Qb0F1QTdEaTJFVWsyU1NSWjM1VXNa?=
 =?utf-8?B?QkJqSXVWV09rbmV4VDdjOXJJU2dPSzdiSzJwV3ZaR1VNVDIxZnREVWV4bjY5?=
 =?utf-8?B?cEdBdTFzWTJzOXRXaXQzejB5VTZCWjhLZ1VnR01Ed3FTTDRaVUhHU2owRjV0?=
 =?utf-8?B?dDB6czUvbWdrNmxxZjIzT2gyaDVMZzhwU1B6WHRDb2s4eXdUV3ZERGsyUGR4?=
 =?utf-8?B?R09iQk92ZjJXTGlPbGh6eDFPZ2xjSzh1MjdrUENRVEprT3hKUmNMTkJ4bHh2?=
 =?utf-8?B?Ukp3MWxWNGRCa3p5eGZPWWxTNjBOeC8weGgrTnVyYkFWK1NYbXpjZlByNUQx?=
 =?utf-8?B?UVh6b3NDSXBDblRjZEZTRWRUUGk5a0VDMnVyeEdVWHVvZ1hQb0Exd1FVN1A0?=
 =?utf-8?B?UCt5bVhLR015OEwyR1d3aFd0N05nNC9hV3dWdUs0RC9VUWRBOXAwbEZoZTls?=
 =?utf-8?B?SkFaWE1RMWx1dGp0akd2YkJ1MGp5Qkg1V3JMaTJGUktwWVBmRDVZMGNKenIx?=
 =?utf-8?B?QWRmYlEzcTZOalJ2ZXVjb2F0cXE4VU8vWUJxV1RKVFg1SUFXdG81bS9uYTR6?=
 =?utf-8?B?eUJOSWdmd3g4T1lhSm81UDloYTA0c1UwazNRUm8zM1JRWE9OOG5mb2VsWFJX?=
 =?utf-8?B?ZndiMVZXMHdBRVowT1pXTVluaVF5K2hQUERkaVNsK093YW11TjlzYXpnZ0pD?=
 =?utf-8?B?MTZoS09uTGZsaENsTDhFV3pFck1lTG44U3g1eTJUYkdneTFKNHdTamJvcWhO?=
 =?utf-8?B?TUtHZmhuUXFpWXFuOTZaYSs2ZEF4QXE1a3pYZmFlRTFHaElvaXhkZlRBa25y?=
 =?utf-8?B?Yk9rZ3NoaWR4dVV1eFEzdUcvQjJ4QjhwZ2o5a240aDRMZjhLcDFsc2E3ZXI2?=
 =?utf-8?B?YWsvQ2hQbGtRdW94SnBtOHVUNmZKL2I0OWtyMDNuaWlrRUFMK09WN1drdktP?=
 =?utf-8?B?cUF4TXNVdCs2NlNhWWMxbnRiTURyTVNVWTYrbGg3ZVV4TjhUL1IvdituQmpx?=
 =?utf-8?B?Q0FHZ3ZNQkNYVllpUEh4R1RBaUtYcCtoWlZoRC94eDhsejUrZUc1MHlFMVoy?=
 =?utf-8?B?SlNCMWcwczNrTERWTytGaUhBNVU1MzZkUWxBcVgyZHdGb2xTUHYxQy84MXZ1?=
 =?utf-8?B?SDdxWVZINjMwUVNrK2hsdTFReFRNNjdlVXY5cGh4UDdhcm5DcDNFaWh5SE95?=
 =?utf-8?Q?KLh7zUL6d0QHgfKYSJpdhj5uZ/8iodZO6zwJ24B?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5874.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXNKWko2N2xjemRRRTZ0eUduZkRaeUhDVW1JNzlGWVd2em5QKzVqdndxUU1M?=
 =?utf-8?B?R043d0NXalcvbnR6VEFyT1ZXS29EVVVTd1M5dmt4WlVCcnJEQitrdkppbFlE?=
 =?utf-8?B?aXBSZE5jU1FNYU85RXpXZnFYZVlKSmFUdXVqMWxuODdaWTNseGRUdGQyZTdS?=
 =?utf-8?B?WmpIZFBnV3NCSndhTGJpZlIvVzRITCsyN0FXR0RXRmlYUVd4OGdtWHRTdU1I?=
 =?utf-8?B?MUxLOWtCajBkeHBPSmpmblBBWTFnd24wK2tUQjYyMFJrRTY0d3ZvUTNwVHB6?=
 =?utf-8?B?emo1dkNUemN4aGxEam83QXQ5OXZoRjB2MHp4Y1dZb1NqWmdHQk56ZUJ1K3cx?=
 =?utf-8?B?SjJqaURyTFJuNlBscStUbE5hOUUzUm9yT2lES0VxbXlRQU8vSndXVC9DVkZP?=
 =?utf-8?B?NWpPWm1jL3NORGpTaXJzRnZKTTIyY2daOTE3U2RvNHlzOVp3RWVlVFpsZlJq?=
 =?utf-8?B?Ym81K1BTNGtEZVV3ZjJkZ21YVERXWTlrYWZmZUwrNU5obEZKOTArdDU0OWNl?=
 =?utf-8?B?bUdnZjZISUNvQ0d1RHlNMTZHVXNSNWRvV2QrWFUyVWw5c0ZoQWprRmxlS1RG?=
 =?utf-8?B?NXR5eHowbGE4TVYwYjYvL2djdjZDTFd2UEJtT3N5dGN6SktLME9iaURXOUFW?=
 =?utf-8?B?ejNxbElRMnk4Mm54VUNzZTd3NUovcmNWUUN1UldLVWRvbGlwUDFGNklJNS9I?=
 =?utf-8?B?alg1Q1hRTHpMMGNuekpoTVFHUkR5ZjN2NnVmZzlGcFUrMFAxTVV0UHRxc3JF?=
 =?utf-8?B?MG1lWkljRWR5eFRZVWhybDhmeHNTWjlLck5tMXVSTWZZSFRMS1hkY254M3VK?=
 =?utf-8?B?ZFNtOG9lNWhBSWhVeFBUVnRXOE5uT1psZFFRSzBsbFBvVmhmQlFwVFhFMFM0?=
 =?utf-8?B?TnZ5ME5oT2ExSEJFRWRaYVY4ME1taXpmQ21CR081Zm9rQkxnUmJ0UG81VEc0?=
 =?utf-8?B?djk1MUMwd0h2ZXc1eTFoeWx2WGd2VnpLWGVnVnRDOHJBeUxTUG9iVzRvK3M1?=
 =?utf-8?B?dWZSZ29ILyttaGhwQWhRd0t4b1V1TUJ0SDRCbVlDcUlZVk1XUk5Ec29BOUdk?=
 =?utf-8?B?TGpFYVRPUEYyNUYyNmpRVzJKWmNVQXlRWThaOFd2ZFZhM0I2dG04azdsSEww?=
 =?utf-8?B?ZWpNS0FkU1hOWEFHay8wN1BXUUJ0SVBHTnNCTHFiZit4aDhzekVvZ0tld0lH?=
 =?utf-8?B?bE80UEVOSlBHZTlrWGQyNFRuT3hrVDd5Ym8xeGVva2E1dUVvek5kR0JiRWJS?=
 =?utf-8?B?aHFHRkVsemtaV2FMTjRrcUVablpQZVBqZWFsTGZXS3VYZ0pGbFBRaDBQUU9I?=
 =?utf-8?B?M2NnUmhKRU53TTM2REgvYkwySG9RWUpRMDRoZmJXTVdPdVB1RFpNdVp4NWwz?=
 =?utf-8?B?eTFnVnFkRllYMDFRMjdBK3JPZGdESDlnWDRWR3ZqeCtrTkNScGdHZzBlMVBn?=
 =?utf-8?B?em9OTldwMkE5dG5ReVdKWXljZjI2LzFTbWRVVGwyc0RQNGEvWjRqaFIyN0dz?=
 =?utf-8?B?KzltVmtFbXhGQ1NGaFU3S0RmUFg0TDBzOHoxdW9qU1l2TTNEMGU2VnNkMEFS?=
 =?utf-8?B?NVNzS2tZZG4rWXlCTWltaFVGZWppOGpmU2FPK1o0N3NRODhId3c3c2MzTHY3?=
 =?utf-8?B?NXhMRGhyS0VHc2VZaGlKZExaOEllMk1wN1VFenVjWFR1eWw2c21kQmRETmpz?=
 =?utf-8?B?NW1DOGI3L25tSlV6a3FrbEd1MXNkUmtNU2JKYm5XV3cySVRBTkhYNm9VdTZ0?=
 =?utf-8?B?OVE3bXh0OFgvWXc2S3hDdURDN3lRZjlkN2pxSXgwQ3BLNGplbzd5WjZHL0RV?=
 =?utf-8?B?Z2xoU2ZGY0dyOHVVRGllTXE0KzRUNzBQaTVVY0ZsTng4R2pIMkRWblM5MDl3?=
 =?utf-8?B?dzNCcVpSNzFTZWtneVo4MDVxNDN0RTNubWxmNlB1azVOQkVXTG1jYjlMTCt4?=
 =?utf-8?B?T3hiL2tTQU9QS2JQQW95NEV3WWhiZmt3OVFNMkE3YzU2c2pnL3FqWGx5K0FY?=
 =?utf-8?B?TzVDTTB5c0ZlWUIvQ25odEltNFhXeDIwU241SGtac1p6aWxLWkI1RXQwaklN?=
 =?utf-8?B?RFhSOXZWcisxblpMRzlMbVh0bVdROU96dUNZQTB0Z3F4NEVGTUFGZzhDTFBO?=
 =?utf-8?Q?0ldyaL2VrlTLItgtkOGuRdMQO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 442f678e-0c3f-4656-d31d-08dc8fbbc598
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5874.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 17:26:21.7849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hinI8h85qujeEORyC1DN0KhqdJXKoCw74tbODipiFpyVnH8R/7/zSlLyroCbNInj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8445



On 6/18/24 11:55 AM, Mathieu Poirier wrote:
> On Tue, Jun 18, 2024 at 11:45:28AM -0500, Tanmay Shah wrote:
>> 
>> 
>> On 6/17/24 10:40 AM, Mathieu Poirier wrote:
>> > Good day,
>> > 
>> > On Mon, Jun 10, 2024 at 08:42:27AM -0700, Tanmay Shah wrote:
>> >> It is possible that remote processor is already running before
>> >> linux boot or remoteproc platform driver probe. Implement required
>> >> remoteproc framework ops to provide resource table address and
>> >> connect or disconnect with remote processor in such case.
>> >> 
>> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
>> >> ---
>> >> 
>> >> Changes in v5:
>> >>   - Fix comment on assigning DETACHED state to remoteproc instance
>> >>     during driver probe.
>> >>   - Fix patch subject and remove "drivers"
>> >> 
>> >> Changes in v4:
>> >>   - Move change log out of commit text
>> >> 
>> >> Changes in v3:
>> >>   - Drop SRAM patch from the series
>> >>   - Change type from "struct resource_table *" to void __iomem *
>> >>   - Change comment format from /** to /*
>> >>   - Remove unmap of resource table va address during detach, allowing
>> >>     attach-detach-reattach use case.
>> >>   - Unmap rsc_data_va after retrieving resource table data structure.
>> >>   - Unmap resource table va during driver remove op
>> >> 
>> >> Changes in v2:
>> >>   - Fix typecast warnings reported using sparse tool.
>> >>   - Fix following sparse warnings:
>> >> 
>> >>  drivers/remoteproc/xlnx_r5_remoteproc.c | 173 +++++++++++++++++++++++-
>> >>  1 file changed, 169 insertions(+), 4 deletions(-)
>> >> 
>> >> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> >> index 84243d1dff9f..6ddce5650f95 100644
>> >> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
>> >> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
>> >> @@ -25,6 +25,10 @@
>> >>  /* RX mailbox client buffer max length */
>> >>  #define MBOX_CLIENT_BUF_MAX	(IPI_BUF_LEN_MAX + \
>> >>  				 sizeof(struct zynqmp_ipi_message))
>> >> +
>> >> +#define RSC_TBL_XLNX_MAGIC	((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
>> >> +				 (uint32_t)'m' << 8 | (uint32_t)'p')
>> >> +
>> >>  /*
>> >>   * settings for RPU cluster mode which
>> >>   * reflects possible values of xlnx,cluster-mode dt-property
>> >> @@ -73,6 +77,26 @@ struct mbox_info {
>> >>  	struct mbox_chan *rx_chan;
>> >>  };
>> >>  
>> >> +/**
>> >> + * struct rsc_tbl_data
>> >> + *
>> >> + * Platform specific data structure used to sync resource table address.
>> >> + * It's important to maintain order and size of each field on remote side.
>> >> + *
>> >> + * @version: version of data structure
>> >> + * @magic_num: 32-bit magic number.
>> >> + * @comp_magic_num: complement of above magic number
>> >> + * @rsc_tbl_size: resource table size
>> >> + * @rsc_tbl: resource table address
>> >> + */
>> >> +struct rsc_tbl_data {
>> >> +	const int version;
>> >> +	const u32 magic_num;
>> >> +	const u32 comp_magic_num;
>> >> +	const u32 rsc_tbl_size;
>> >> +	const uintptr_t rsc_tbl;
>> >> +} __packed;
>> >> +
>> >>  /*
>> >>   * Hardcoded TCM bank values. This will stay in driver to maintain backward
>> >>   * compatibility with device-tree that does not have TCM information.
>> >> @@ -95,20 +119,24 @@ static const struct mem_bank_data zynqmp_tcm_banks_lockstep[] = {
>> >>  /**
>> >>   * struct zynqmp_r5_core
>> >>   *
>> >> + * @rsc_tbl_va: resource table virtual address
>> >>   * @dev: device of RPU instance
>> >>   * @np: device node of RPU instance
>> >>   * @tcm_bank_count: number TCM banks accessible to this RPU
>> >>   * @tcm_banks: array of each TCM bank data
>> >>   * @rproc: rproc handle
>> >> + * @rsc_tbl_size: resource table size retrieved from remote
>> >>   * @pm_domain_id: RPU CPU power domain id
>> >>   * @ipi: pointer to mailbox information
>> >>   */
>> >>  struct zynqmp_r5_core {
>> >> +	void __iomem *rsc_tbl_va;
>> >>  	struct device *dev;
>> >>  	struct device_node *np;
>> >>  	int tcm_bank_count;
>> >>  	struct mem_bank_data **tcm_banks;
>> >>  	struct rproc *rproc;
>> >> +	u32 rsc_tbl_size;
>> >>  	u32 pm_domain_id;
>> >>  	struct mbox_info *ipi;
>> >>  };
>> >> @@ -621,10 +649,19 @@ static int zynqmp_r5_rproc_prepare(struct rproc *rproc)
>> >>  {
>> >>  	int ret;
>> >>  
>> >> -	ret = add_tcm_banks(rproc);
>> >> -	if (ret) {
>> >> -		dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
>> >> -		return ret;
>> >> +	/*
>> >> +	 * For attach/detach use case, Firmware is already loaded so
>> >> +	 * TCM isn't really needed at all. Also, for security TCM can be
>> >> +	 * locked in such case and linux may not have access at all.
>> >> +	 * So avoid adding TCM banks. TCM power-domains requested during attach
>> >> +	 * callback.
>> >> +	 */
>> >> +	if (rproc->state != RPROC_DETACHED) {
>> >> +		ret = add_tcm_banks(rproc);
>> >> +		if (ret) {
>> >> +			dev_err(&rproc->dev, "failed to get TCM banks, err %d\n", ret);
>> >> +			return ret;
>> >> +		}
>> > 
>> > In the normal case function add_tcm_banks() will call zynqmp_pm_request_node()
>> > but in the attach case, that gets done in zynqmp_r5_attach().  Either way,
>> > zynqmp_pm_release_node() is called in zynqmp_r5_rproc_unprepare().  This is
>> > highly confusing.
>> > 
>> > I suggest adding a check to see if the remote processor is being attached to in
>> > add_tcm_banks() and skip the rest of the TCM initialization if it is the case.
>> > 
>> 
>> If we move this check to add_tcm_banks, then I think I should perform request_node
>> from within add_tcm_banks only and remove registering attach() op as well. I can call
>> request_node from within add_tcm_banks() and then avoid rest of initialization.
>> 
>> I am not sure if without attach() registartion, I can still register detach() and
>> it's valid. I will test this.
>>
> 
> Just add an attach() that returns 0.

Thanks, Ack.

> 
>> 
>> >>  	}
>> >>  
>> >>  	ret = add_mem_regions_carveout(rproc);
>> >> @@ -662,6 +699,120 @@ static int zynqmp_r5_rproc_unprepare(struct rproc *rproc)
>> >>  	return 0;
>> >>  }
>> >>  
>> >> +static struct resource_table *zynqmp_r5_get_loaded_rsc_table(struct rproc *rproc,
>> >> +							     size_t *size)
>> >> +{
>> >> +	struct zynqmp_r5_core *r5_core;
>> >> +
>> >> +	r5_core = rproc->priv;
>> >> +
>> >> +	*size = r5_core->rsc_tbl_size;
>> >> +
>> >> +	return (struct resource_table *)r5_core->rsc_tbl_va;
>> >> +}
>> >> +
>> >> +static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>> >> +{
>> >> +	struct resource_table *rsc_tbl_addr;
>> >> +	struct device *dev = r5_core->dev;
>> >> +	struct rsc_tbl_data *rsc_data_va;
>> >> +	struct resource res_mem;
>> >> +	struct device_node *np;
>> >> +	int ret;
>> >> +
>> >> +	/*
>> >> +	 * It is expected from remote processor firmware to provide resource
>> >> +	 * table address via struct rsc_tbl_data data structure.
>> >> +	 * Start address of first entry under "memory-region" property list
>> >> +	 * contains that data structure which holds resource table address, size
>> >> +	 * and some magic number to validate correct resource table entry.
>> >> +	 */
>> >> +	np = of_parse_phandle(r5_core->np, "memory-region", 0);
>> >> +	if (!np) {
>> >> +		dev_err(dev, "failed to get memory region dev node\n");
>> >> +		return -EINVAL;
>> >> +	}
>> >> +
>> >> +	ret = of_address_to_resource(np, 0, &res_mem);
>> > 
>> > Shouldn't an of_put_node() be added right here?
>> 
>> Usually function documentation explicitly ask if it is needed. I will check
>> and add if required. I will also check any other references in kernel.
>> 
> 
> You need to release @np acquired by of_parse_phandle() above.
> 

Yes I missed that part. I was looking at of_address_to_resource documentation.
Thanks.

>> > 
>> >> +	if (ret) {
>> >> +		dev_err(dev, "failed to get memory-region resource addr\n");
>> >> +		return -EINVAL;
>> >> +	}
>> >> +
>> >> +	rsc_data_va = (struct rsc_tbl_data *)ioremap_wc(res_mem.start,
>> >> +							sizeof(struct rsc_tbl_data));
>> >> +	if (!rsc_data_va) {
>> >> +		dev_err(dev, "failed to map resource table data address\n");
>> >> +		return -EIO;
>> >> +	}
>> >> +
>> >> +	/*
>> >> +	 * If RSC_TBL_XLNX_MAGIC number and its complement isn't found then
>> >> +	 * do not consider resource table address valid and don't attach
>> >> +	 */
>> >> +	if (rsc_data_va->magic_num != RSC_TBL_XLNX_MAGIC ||
>> >> +	    rsc_data_va->comp_magic_num != ~RSC_TBL_XLNX_MAGIC) {
>> >> +		dev_dbg(dev, "invalid magic number, won't attach\n");
>> >> +		return -EINVAL;
>> >> +	}
>> >> +
>> >> +	r5_core->rsc_tbl_va = ioremap_wc(rsc_data_va->rsc_tbl,
>> >> +					 rsc_data_va->rsc_tbl_size);
>> >> +	if (!r5_core->rsc_tbl_va) {
>> >> +		dev_err(dev, "failed to get resource table va\n");
>> >> +		return -EINVAL;
>> >> +	}
>> >> +
>> >> +	rsc_tbl_addr = (struct resource_table *)r5_core->rsc_tbl_va;
>> >> +
>> >> +	/*
>> >> +	 * As of now resource table version 1 is expected. Don't fail to attach
>> >> +	 * but warn users about it.
>> >> +	 */
>> >> +	if (rsc_tbl_addr->ver != 1)
>> >> +		dev_warn(dev, "unexpected resource table version %d\n",
>> >> +			 rsc_tbl_addr->ver);
>> >> +
>> >> +	iounmap((void __iomem *)rsc_data_va);
>> >> +	r5_core->rsc_tbl_size = rsc_data_va->rsc_tbl_size;
>> >> +
>> > 
>> > Can you spot the problem here?
>> 
>> Ah! It's like use-after-free problem. Address should have been unmapped
>> at then end of the function. Surprisingly My test passed on platform, so I
>> didn't pay attention. This will be fixed in next revision.
> 
> I'm also surprised - this should have blown up.
> 
>> 
>> Thanks,
>> Tanmay
>> 
>> > 
>> > Thanks,
>> > Mathieu
>> > 
>> >> +	return 0;
>> >> +}
>> >> +
>> >> +static int zynqmp_r5_attach(struct rproc *rproc)
>> >> +{
>> >> +	struct zynqmp_r5_core *r5_core = rproc->priv;
>> >> +	int i, pm_domain_id, ret;
>> >> +
>> >> +	/*
>> >> +	 * Firmware is loaded in TCM. Request TCM power domains to notify
>> >> +	 * platform management controller that TCM is in use. This will be
>> >> +	 * released during unprepare callback.
>> >> +	 */
>> >> +	for (i = 0; i < r5_core->tcm_bank_count; i++) {
>> >> +		pm_domain_id = r5_core->tcm_banks[i]->pm_domain_id;
>> >> +		ret = zynqmp_pm_request_node(pm_domain_id,
>> >> +					     ZYNQMP_PM_CAPABILITY_ACCESS, 0,
>> >> +					     ZYNQMP_PM_REQUEST_ACK_BLOCKING);
>> >> +		if (ret < 0)
>> >> +			pr_warn("TCM %d can't be requested\n", i);
>> >> +	}
>> >> +
>> >> +	return 0;
>> >> +}
>> >> +
>> >> +static int zynqmp_r5_detach(struct rproc *rproc)
>> >> +{
>> >> +	/*
>> >> +	 * Generate last notification to remote after clearing virtio flag.
>> >> +	 * Remote can avoid polling on virtio reset flag if kick is generated
>> >> +	 * during detach by host and check virtio reset flag on kick interrupt.
>> >> +	 */
>> >> +	zynqmp_r5_rproc_kick(rproc, 0);
>> >> +
>> >> +	return 0;
>> >> +}
>> >> +
>> >>  static const struct rproc_ops zynqmp_r5_rproc_ops = {
>> >>  	.prepare	= zynqmp_r5_rproc_prepare,
>> >>  	.unprepare	= zynqmp_r5_rproc_unprepare,
>> >> @@ -673,6 +824,9 @@ static const struct rproc_ops zynqmp_r5_rproc_ops = {
>> >>  	.sanity_check	= rproc_elf_sanity_check,
>> >>  	.get_boot_addr	= rproc_elf_get_boot_addr,
>> >>  	.kick		= zynqmp_r5_rproc_kick,
>> >> +	.get_loaded_rsc_table = zynqmp_r5_get_loaded_rsc_table,
>> >> +	.attach		= zynqmp_r5_attach,
>> >> +	.detach		= zynqmp_r5_detach,
>> >>  };
>> >>  
>> >>  /**
>> >> @@ -723,6 +877,16 @@ static struct zynqmp_r5_core *zynqmp_r5_add_rproc_core(struct device *cdev)
>> >>  		goto free_rproc;
>> >>  	}
>> >>  
>> >> +	/*
>> >> +	 * If firmware is already available in the memory then move rproc state
>> >> +	 * to DETACHED. Firmware can be preloaded via debugger or by any other
>> >> +	 * agent (processors) in the system.
>> >> +	 * If firmware isn't available in the memory and resource table isn't
>> >> +	 * found, then rproc state remains OFFLINE.
>> >> +	 */
>> >> +	if (!zynqmp_r5_get_rsc_table_va(r5_core))
>> >> +		r5_rproc->state = RPROC_DETACHED;
>> >> +
>> >>  	r5_core->rproc = r5_rproc;
>> >>  	return r5_core;
>> >>  
>> >> @@ -1134,6 +1298,7 @@ static void zynqmp_r5_cluster_exit(void *data)
>> >>  	for (i = 0; i < cluster->core_count; i++) {
>> >>  		r5_core = cluster->r5_cores[i];
>> >>  		zynqmp_r5_free_mbox(r5_core->ipi);
>> >> +		iounmap(r5_core->rsc_tbl_va);
>> >>  		of_reserved_mem_device_release(r5_core->dev);
>> >>  		put_device(r5_core->dev);
>> >>  		rproc_del(r5_core->rproc);
>> >> 
>> >> base-commit: d7faf9a16886a748c9dd4063ea897f1e68b412f2
>> >> -- 
>> >> 2.37.6
>> >> 
>> 

