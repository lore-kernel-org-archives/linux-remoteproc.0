Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="AdH+gzK8";
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="AdH+gzK8"
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2059.outbound.protection.outlook.com [40.107.8.59])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52CE9D6
	for <linux-remoteproc@vger.kernel.org>; Tue, 28 Nov 2023 03:19:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RKaZTUKIY2HCfmVO6+HC/1byWMrmj4B0nNO0y8neqq/TyjHV6uvoFXLAJFZSixqmOdSH2lJmOiNWCVy6qMBTOcq8ymWpoGtxakjD097EgcvbwdisS9lr6B3gQpFX9uLOuGMIBpSQw5T7PSymNvDpFRtDNp6ogfShcs0m/fogiPFwZp0gYwN+XEronrGtUx9s/p2zhB6RKHMQDKq/pkypwcaJ0lEvuYgGZdvo4DrPp1njG2zyo+o7fboYzAg8fgOitu7LFyIg63bVkJbXDuGfxH7KYdeKM7t8+/6DQqs8S5OdjhkvHYXRi7iTBu7xvvaH7fyn2zuJ997BQ6u4Kc4Cgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQv5vAELnVBpzXMIlWK3PxbAyOaAD3v4nSuI+5P/Ly8=;
 b=eQx6zzLQO3z+T21DpefazG7LcsiXbInuvmXQWph/N3kcbcovADd8ZIbdzG0a28fUJVvcw8ju+25pgkwNG2qoCDUW6K7nLCIoRIRuX6O/QF9Jk20LR8UbVlgn7KWSKuLoY/6sKrGKmPd4o1AijHFH1A4AHPS8rYCtSVBS7HafV6RfkBtOIBBD9PF/fGgMt7kLlnw18CPrMzFNzJOkXcM++3t3bvurzam/2YVD01OWrbPOlhSHaWk0Dhb+YYqjjlBL+msN95l29Qxv7kyTN9+j0b08gcrtikRgfkX9GVQcIjt6Gc1lFB6jKBwzsgIfQQ0KBSl1B5e3jyosSMwstaWNRQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQv5vAELnVBpzXMIlWK3PxbAyOaAD3v4nSuI+5P/Ly8=;
 b=AdH+gzK8xxUUL7u71vLrOmhQCyFvVWF/Rn/Xa/e7DlQcWGkM/7FX8dwfl76ONlCGboeHX+Z/WKwwHsbHZ7Mxw2fKAvU7uATYcX8CCHgUwf7yNBHszYbNuGNpa1haJigNSQSmc83ANAx7teYPOxtyw+F/QSHCUlTLVlUfYH2dJi8=
Received: from DB3PR08CA0009.eurprd08.prod.outlook.com (2603:10a6:8::22) by
 PAWPR08MB10120.eurprd08.prod.outlook.com (2603:10a6:102:365::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 11:19:22 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:8:0:cafe::cf) by DB3PR08CA0009.outlook.office365.com
 (2603:10a6:8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28 via Frontend
 Transport; Tue, 28 Nov 2023 11:19:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 11:19:21 +0000
Received: ("Tessian outbound 7671e7ddc218:v228"); Tue, 28 Nov 2023 11:19:21 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: b00006363b9ecee4
X-CR-MTA-TID: 64aa7808
Received: from 87cf78f2027f.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0B41D370-494E-4A5D-A49D-2936D01A3F19.1;
	Tue, 28 Nov 2023 11:19:14 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 87cf78f2027f.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 28 Nov 2023 11:19:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vyy7vyM97Qdt0+qqxI/XwVoz+hFA73G/PYp4Qu/abVNMQHUHzdgASiRvA3+vZH+i2tEvoiTGor6quL683wy1YwS+Q3Ryn7XoM6e50Se4YOmSgI5zgs5U3xG4vR+o7HAiIOq0aypkvXha68RCN1QS3DjhHYZX2zKtTkEI1LV7cDbtK0RZ7gFJdo4UdHGmfhd80mQBHsQLiT0rBu6/TwPK62KOSEi4tO7D+9PdzFO6OezVyvWoUBA7NFpdndI3S95tNSEvzzXv1Qr3+t00HiMMg6ERqjrr/qBOEbWVvQnIaXicHDAp4xBURpXTLdJvfblEX3F02TL5gOaxpvoQ9GU+ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQv5vAELnVBpzXMIlWK3PxbAyOaAD3v4nSuI+5P/Ly8=;
 b=kr8kw84ydOThfvp9gzb1dj0ne7kun9m8mgZcMR/EdJ8YROUCIw8osS9KxZ2zIV0FSa+ZJpOMNLerYWe0sdUPQ0swY+9dNqTMmcoBEtdKxEGiWqZvayTU73Ki3K2JpFOz3mIc8Y1jq9u4Gy6JOytGq+c1PGIdx2EGQAAGUsiKXtWmq2+8azDEaUyFs3omXKbBUUlNIqzYio03AVuydjjhEyMbMD9GA/TM4LUIqYQ3ZRQRVc5+53kOELdhJ8SHCdKsDQ2LeaQCeUbUHBU8apJCW/Vzj9/UEZaOeKUZrpjUML4b7tMR37HpSCPv56UKfhMmEOQ06SFv1bkAIIr5zCNHIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQv5vAELnVBpzXMIlWK3PxbAyOaAD3v4nSuI+5P/Ly8=;
 b=AdH+gzK8xxUUL7u71vLrOmhQCyFvVWF/Rn/Xa/e7DlQcWGkM/7FX8dwfl76ONlCGboeHX+Z/WKwwHsbHZ7Mxw2fKAvU7uATYcX8CCHgUwf7yNBHszYbNuGNpa1haJigNSQSmc83ANAx7teYPOxtyw+F/QSHCUlTLVlUfYH2dJi8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAXPR08MB6750.eurprd08.prod.outlook.com (2603:10a6:102:13f::16)
 by GVXPR08MB10500.eurprd08.prod.outlook.com (2603:10a6:150:155::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Tue, 28 Nov
 2023 11:19:12 +0000
Received: from PAXPR08MB6750.eurprd08.prod.outlook.com
 ([fe80::542e:1889:d107:2e96]) by PAXPR08MB6750.eurprd08.prod.outlook.com
 ([fe80::542e:1889:d107:2e96%4]) with mapi id 15.20.7025.022; Tue, 28 Nov 2023
 11:19:12 +0000
Message-ID: <80b61579-4dc5-4e43-924e-edd6ebd514e9@arm.com>
Date: Tue, 28 Nov 2023 11:19:10 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [Discussion]: Enhance virtio rpmsg bus driver buffer allocation
Content-Language: en-US
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
 linux-remoteproc@vger.kernel.org
Cc: "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>
References: <1af16ff8-5706-45e5-9737-05da39957c95@arm.com>
 <7eb830b3-e915-4151-ae10-46ce7cd68fa1@arm.com>
 <b98f58a2-6627-4e8a-9466-4f6276cfd0b3@foss.st.com>
 <66dc0fbc-0898-4597-92a4-489050cb1b1c@arm.com>
 <3f0b831b-eda0-44c4-ad1b-1d4958d90ecd@foss.st.com>
From: Divin Raj <divin.raj@arm.com>
In-Reply-To: <3f0b831b-eda0-44c4-ad1b-1d4958d90ecd@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P265CA0196.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::6) To PAXPR08MB6750.eurprd08.prod.outlook.com
 (2603:10a6:102:13f::16)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB6750:EE_|GVXPR08MB10500:EE_|DU6PEPF0000B622:EE_|PAWPR08MB10120:EE_
X-MS-Office365-Filtering-Correlation-Id: 8057f666-0f4b-4775-c5c8-08dbf003dede
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 M6sKBS5OqbzE6UQ0PbcbntY2tAUd2JdSdar+y+0u2pueddjH8X34If7UmCKf3yeLLoag3pJTrPlk1ACqf5ZzFLeb2bFlYzVFkhG++BgFj/QuYh005vkgnNBjjnZrf8ymmKuVyMYXgBScAH+C23iESSAJJd6bOY1EeuHlD/KMPh3KmApAq0MkXwEdN/LAynTXGpQuHmHeBMuzorI/kQGm3a9QszgD2Vy31WjWF0yhz4wuK6oltp+caRJuiiZmCF6J9sn9KEa3uzUb8yKk8WP1MhvLzKAxIn8lLQe3mgjKdIzZMjexSidJSQj7ep0xpmHDeQlpKb890/d4cAZCSjoTi1rdB2YIRiMWdOocilvmX8JHpnJLIYmR1oLrE4BjhtuGn6wU/3soCnDjJ8hq1YwtmK4oa8Dkb2choLeu2A20p2xETQQHDfI7BXTVQNVD28Slc8X+TEE6X0AKmzOEOua+WLInAAgr26zT4jvkM7k2A3b1veyA2gX4WN/b0FsjP5EsLY+wgSumhRviGTQQCFzrYjVC0155mTmFEaJD4cAdaTpOc2PqD42boskMpCya4CD4lphUkP1RdduPSlVs9V4wkZt5wMLf0vGBCd+e45CWz/ETX32Gpfnyb2HA+R/p+H0c+8T7jW4NPqGw6YVd9EkaQ/sLTihBlPN9T0Wa28WWCeuBTdtjfowowSt1P5EetkZK
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6750.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(31686004)(26005)(66899024)(53546011)(2616005)(478600001)(6486002)(6506007)(6512007)(966005)(38100700002)(86362001)(5660300002)(31696002)(36756003)(41300700001)(2906002)(44832011)(66946007)(83380400001)(66476007)(66556008)(316002)(8676002)(8936002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10500
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4f04b6d7-f70b-4207-cb85-08dbf003d939
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2QJSLGx/vRTAx4X4pZL/7EnDktUv+UWqY2YIFwSM83xc4j7BcUNBYKA4YdoUjWwFyWgvyks+J8r1VA/PevSC2ZwVd+ijVBB/jZcVvJY+Vlx/J8WK7eaC+q8fXrlv0b9F2LPMSqT8Ye8pBxOFj+Nfn+ZiqVPzzSIKzlF0ddsTinWsZtFziD4FiUhbOcYZBrytO1EEIIhdl2m37oGn/+LRindgACYs0TOuUEozCWfOsCzbqMP0IY5KziaXirgOYSQ1cLF2aVSqnssGxbvOSIwnk52O+Thnsln0THFCxGgm1Fbh1OvPYe8K1akbTCHDanmL3P6v7kIdAiqgaJ4fqh0784T13sRi8/V7ZVsL9eCqDT7nBZ13ypco2kVVXsg7lDV4kcigv3S6lI/BU8amyMguIYFEZc9kT/muxZSrDx+Ua61qBqQzbOWXiSMKgkA7D0+ruWT2YNy0byZDqwQQ4iDRBR5H2B9iONQBz0ycKNrl1gbiouMZc00cYA80xCuSfyJfwt4MFaD0o7WubkVqoIQJt48FYlsKtb8tMw+umOfsyUrFsUZl6dhIeulUwvDIerjQd4nEv/Ek/xGFNYIvqqkS7QgEmXE/LE+8eAdnWrbrjkDWRKv0o09HwLNBU/nhhwDGqEZePWhur/CF9RMSt4DgdLMoqqsZTe3nIJ+x9jeJ3tuQjB7QpmgBYuszdgqgt4XbXLZw9p4opDRuPmBULxiripU4qvvf07V5GbwKXBD5JIbuiszUsBsmbOEnrdMqZB8PNB6uYnD9TDndBUpIAdRXBJMpn2xDEPeUISWfbF8XQ4E=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(46966006)(40470700004)(36840700001)(336012)(53546011)(2616005)(478600001)(26005)(6506007)(6512007)(47076005)(36860700001)(5660300002)(83380400001)(2906002)(4326008)(41300700001)(70206006)(70586007)(316002)(966005)(6486002)(44832011)(8676002)(8936002)(40460700003)(356005)(81166007)(86362001)(31696002)(82740400003)(36756003)(31686004)(40480700001)(66899024)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 11:19:21.7610
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8057f666-0f4b-4775-c5c8-08dbf003dede
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10120

On 11/28/23 8:34 AM, Arnaud POULIQUEN wrote:
>
>
> On 11/24/23 17:45, Divin Raj wrote:
>> Hi Arnaud,
>> Please find my comments inline.
>>
>> On 11/20/23 10:14 AM, Arnaud POULIQUEN wrote:
>>> Hi Divin,
>>>
>>> On 11/17/23 23:24, Divin Raj wrote:
>>>> On 10/23/23 11:44 AM, Divin Raj wrote:
>>>>> Hello all,
>>>>>
>>>>> I am reaching out with reference to the patch discussed here: Enhance=
d
>>>>> virtio rpmsg bus driver buffer allocation.
>>>>> <https://lore.kernel.org/all/CAH2Cfb-sv3SAL8bcczC-Dc3_r58MYZCS7s7zGtn=
1Qfo3mmBqVg@mail.gmail.com/>
>>>>>
>>>>> I've been keenly following the developments around enhancing buffer
>>>>> allocation strategies, especially those focused on dynamic buffer siz=
ing
>>>>> and the considerations for systems under varying memory constraints.T=
his
>>>>> work is highly relevant to several projects I am involved in, and I a=
m
>>>>> quite interested in its progression. May I kindly request an update o=
n
>>>>> the current phase of these initiatives? Additionally, I am eager to k=
now
>>>>> if there would be an opportunity for me to contribute to enhancing th=
e
>>>>> patch, possibly by working on improvements or assisting in verificati=
on
>>>>> processes.
>>>>>
>>>>> Furthermore, if there are any condensed resources, summaries, or
>>>>> specific threads that encapsulate recent advancements or discussions =
on
>>>>> this topic, I would be grateful to receive directions to them.
>>>>>
>>>>> I appreciate everyone's dedicated efforts and invaluable contribution=
s
>>>>> to this area of development. Looking forward to the updates.
>>>>>
>>>>> Regards Divin
>>>>>
>>>> Hello Linux Community,
>>>>
>>>> In one of our internal projects, we encountered a challenge with RPMSG
>>>> buffer allocation. Our goal is to optimize memory allocation for an
>>>> out-of-tree RPMSG Ethernet device driver using virtio. This is to ensu=
re
>>>> support for packet sizes matching the standard MTU (Maximum Transmissi=
on
>>>> Unit) size of 1500 bytes.
>>>>
>>>> To mitigate this issue, There are few possible solutions:
>>>>
>>>> 1. Configure buffer size and number through Kconfig.
>>>> 2. Permit the firmware creator to determine the most suitable value fr=
om
>>>>     the resource table.
>>>> 3. Enable independent configurations on both ends. This approach would
>>>> support both dynamic and fixed buffer configurations using a generic
>>>> allocator.
>>>>
>>>> Reference:
>>>>
>>>> [1]:
>>>> https://lore.kernel.org/all/1548949280-31794-4-git-send-email-xiaoxian=
g@xiaomi.com/
>>>> [2]: https://lore.kernel.org/all/20190701061353.GE1263@builder/
>>>>
>>>>
>>>> Draft Design Overview:
>>>>
>>>> Based on the reference patch and the discussions, we have outlined the
>>>> following key points for the belw design:
>>>>
>>>> 1. Assure compatibility, enabling both Linux and the remote system to
>>>> interchangeably transmit and receive messages, irrespective of size.
>>>> 2. For systems with constrained shared memory:
>>>> Systems with small, shared memory, we need to deal with a
>>>> limited/optimized memory chunk. To avoid memory fragmentation, the
>>>> allocator should have a pre-reserved buffer pool
>>>> 3. The implementation should ensure that the remote side does not
>>>> receive messages based on its allocation parameters.
>>>>
>>>> do you think it could make sense?
>>>>
>>>> High level view:
>>>> +------------------+                               +------------------=
+
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Linux       |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Remote      |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>>>> |=C2=A0=C2=A0 +----------+   |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +--=
---------------+     |=C2=A0=C2=A0 +----------+   |
>>>> |=C2=A0=C2=A0 |=C2=A0=C2=A0 RPMSG  |=C2=A0=C2=A0 | <---> | Buffer Allo=
cator|<--->|=C2=A0=C2=A0 | RPMSG    |=C2=A0=C2=A0 |
>>>> |=C2=A0=C2=A0 +----------+   |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | (=
Dynamic/Static)|=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 +----------+   |
>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +--=
---------------+     |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> +------------------+                               +------------------=
+
>>>>
>>>>
>>>> Detailed view:
>>>>
>>>>                     +-------------------------+
>>>>                     |=C2=A0 Message Creation       |
>>>>                     |=C2=A0 (Both Linux/Remote)    |
>>>>                     +------------+------------+
>>>>                                  |
>>>>                                  v
>>>>                     +-------------------------+
>>>>                     | Determine the allocation|
>>>>                     | strategy                |
>>>>                     +------------+------------+
>>>>                                  |
>>>>                   +--------------+--------------+
>>>>                   |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>> +-------------------------------+  +-------------------------------+
>>>> | Dynamic allocation            |=C2=A0 | Static allocation           =
  |
>>>> | (Buffer allocator allocates   |=C2=A0 | (Pre-reserved memory        =
  |
>>>> | memory space as needed,       |=C2=A0 | space)                      =
  |
>>>> | based on the current          |=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |
>>>> | message requirement )         |=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |
>>>> +-------------------------------+  +-------------------------------+
>>>
>>> Do you have a proposal for dynamic allocation?
>>>
>>> RPMSG is based on the virtio protocol. The virtio driver in the Linux k=
ernel
>>> is responsible for allocating buffers for the virtio device on the remo=
te
>>> processor.
>>>
>>> In the current implementation (static allocation) the Linux
>>> kernel allocates predefined buffers for the remote processor.
>>>
>>> How would you manage the fact that the sender allocates its own buffers=
 and
>>> references
>>> them in the vring descriptor? This would require each core to have
>>> a dual role, right?
>>> - a virtio driver role on its TX vring
>>> - a virtio device role on its RX vring."
>>>
>> I'm unsure if a dual role is feasible under the Virtio specification.
>
> At least, it does not seem to align with the philosophy of VirtIO.
>
>
>> However, would it make sense to set the size of the outbuf based on the
>> Maximum Transmission Unit (MTU) size that is supported? Additionally,
>> the size of the inbuf could be set by the firmware, suggesting that it
>> should be derived from the resource table. With this approach, I believe
>> the sender can decide the maximum size.
>
> It is not clear to me what your proposal is.
> Are you speaking about a pre-allocated buffers as proposed in [1],
> or are you speaking about dynamic allocation of the RPMsg in a pool?

we are at the initial phase of this investigation. As we previously
discussed, option 3 is not feasible in accordance with the virtio
specification.The above proposed solution aligns with [1], suggesting
preallocated in_buf and out_buf, with sizes determined from the resource
table and MTU. By allowing Linux to decide the out_buf size and the
remote to decide the in_buf size, I believe we can avoid conflicts. If
everyone agrees on a common idea, then it would be a good starting point

Regards
Divin

> Regards,
> Arnaud
>
>>
>> Regards
>> Divin
>>
>>>
>>> Regards,
>>> Arnaud
>>>
>>
>>>
>>>>
>>>> We would greatly appreciate any feedback, suggestions, or improvements
>>>> you could provide.
>>>>
>>>> Thank you for your time and consideration.
>>>>
>>>> Regards
>>>> Divin
>>>> IMPORTANT NOTICE: The contents of this email and any attachments are
>>>> confidential and may also be privileged. If you are not the intended r=
ecipient,
>>>> please notify the sender immediately and do not disclose the contents =
to any
>>>> other person, use it for any purpose, or store or copy the information=
 in any
>>>> medium. Thank you.
>>
>> IMPORTANT NOTICE: The contents of this email and any attachments are
>> confidential and may also be privileged. If you are not the intended rec=
ipient,
>> please notify the sender immediately and do not disclose the contents to=
 any
>> other person, use it for any purpose, or store or copy the information i=
n any
>> medium. Thank you.

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
