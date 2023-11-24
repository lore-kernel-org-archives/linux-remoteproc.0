Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="Zjv6wa5y";
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="Zjv6wa5y"
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2064.outbound.protection.outlook.com [40.107.21.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8858F19A5
	for <linux-remoteproc@vger.kernel.org>; Fri, 24 Nov 2023 08:45:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=mAK+77xavlCR8drc5Hl4AHPRkFSjtiBwX2K2KoOuTk5JQn+YskykhVWMbrwxBxDy8T48JxG8qfwB8TrIX64gjExm7nrgprK6whV811KybYJ6BXy62hS6iIuzsZbr4xBPx96Gf0MpDRUSprp7KmwKHqH5VEME6Mgy6CLw62BprJcjO6gU/haAA2RhzndAW/S/Y7MCFWZQR54mDm29PTE/82OSdma6i3n9YyjulRXJE4sWcQX/SiLtTD0YsdDaMpUgpHbSH55yDFTBXfEN9NVffuGzMuPy5IuVi1kD44oCWwLOeJMFMf1oQQ301LNGltMa/sXe4vS73GIYo4ql1FoS4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGhNM70EXOc+MpRIzjn/b3lczhhhD4f2x6JSVL7un+c=;
 b=eGlTBbTpd4pnaI+RyU/af2D4IrLyDumMpVHSNnX3ipyuusX6kwc2TrksOVuxmSdpixn2gRh3LntTL7cCBWHto5RvsPnlEdOJY9ckBD/QHPsXN+Ty/c5QjCW/LqulFZP8qNYr6wW0tugjtFVBQxOuC4vbhZ05Z71zid9bBtOc/vSA6S+Uvx496hgmu1KxzTJy1I4YraSW/a2FOpnTG7jKzRckfLmSU0LnRHWE981F8uB0ogMQByc/vJ2GeSojjzv3ajkVukveoa3x+ysqfaq7tsemjsoaNz4MVxuzpwxIixJUAzBn7SWBWOfOa6aWI0ElX74J/E1b6BpBBjZv5tGBPg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGhNM70EXOc+MpRIzjn/b3lczhhhD4f2x6JSVL7un+c=;
 b=Zjv6wa5yLn2QqMt6XnOOMvG9Z33A0uO76ItmfOuhQ7Y2uAOQkVX8E85BZeKJ+BsBJ8A8RftDIpBHbe9phT3fectV9Cmf2lIA1J2eYz0by0TYIdjV+XxsQI5iErv6hSmiHeSKYVlWXPH47GTCqzLboE4zzd2cB/O9EL5+B6YskIY=
Received: from AS9PR06CA0697.eurprd06.prod.outlook.com (2603:10a6:20b:49f::25)
 by GV2PR08MB9206.eurprd08.prod.outlook.com (2603:10a6:150:d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Fri, 24 Nov
 2023 16:45:44 +0000
Received: from AMS0EPF00000197.eurprd05.prod.outlook.com
 (2603:10a6:20b:49f:cafe::ba) by AS9PR06CA0697.outlook.office365.com
 (2603:10a6:20b:49f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21 via Frontend
 Transport; Fri, 24 Nov 2023 16:45:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000197.mail.protection.outlook.com (10.167.16.219) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 16:45:43 +0000
Received: ("Tessian outbound 5d213238733f:v228"); Fri, 24 Nov 2023 16:45:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ee280ab0274f0af9
X-CR-MTA-TID: 64aa7808
Received: from c6054149026d.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5AC18E3C-AA03-4A34-9F90-0A7EEC34A41E.1;
	Fri, 24 Nov 2023 16:45:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c6054149026d.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 24 Nov 2023 16:45:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGQQ9a+7sYABt6S/R/lZamvC7pnYMPE4wljgaQwA46vVRWeE2tuUVXLonB941o5y8jjcUxsmO/anHjco9wOt4Hi/qNIN7/qYLACpnkdzfamj1KmYYGL8DkEGU21ZhNARG6Op2GFUa2uA0hqR3xTvMMBHkUK0hwQnVes1Tt8/0f0d+vYrxyIimq60Tr080pkgs3uca1yeapWEzSEOrIoIcx2HJ3kGZ3tuw6Hj++B8HcygwSInu1WyJPoslfrgADOmfqW5WTdxMhZNUPkkXh87sW3wLcoAPaD8d80nDOgDC+ugzJeUMm1ZRGrEn6V8I1O7rzsTTlUcfqVKOv9PW6U9yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGhNM70EXOc+MpRIzjn/b3lczhhhD4f2x6JSVL7un+c=;
 b=OInJmGOoZXcOdrP/4mzgam2S3j5rWJXdztuhjLsI9ivqx29aExuj+HH1MdMwfmKywgB0tiYOIgi4wLrsz+uQKtugxuB8PWoYII4506vFyAsgtmQWT5nJLYeSbzjklcS1LN43EJ4tUCGYRRSrWwgvoUBHLXmCURtdBY5jOoosQCClIiCuGpZN9EXIgazsGWFp1ZPJJv079WHfSeQC9wFaq3x4LhPDsNXdyLA61hzAH+Lr9s2+tJInavC4MJp76smfDbvVBNpAaUfcwEuh4QNEkB0RrqgLTmbr0lGBDCn80dIQTLJL/htr1OdkEgFUqpxncpbJ0z/5oqL0C3sl0kUUWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGhNM70EXOc+MpRIzjn/b3lczhhhD4f2x6JSVL7un+c=;
 b=Zjv6wa5yLn2QqMt6XnOOMvG9Z33A0uO76ItmfOuhQ7Y2uAOQkVX8E85BZeKJ+BsBJ8A8RftDIpBHbe9phT3fectV9Cmf2lIA1J2eYz0by0TYIdjV+XxsQI5iErv6hSmiHeSKYVlWXPH47GTCqzLboE4zzd2cB/O9EL5+B6YskIY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAXPR08MB6750.eurprd08.prod.outlook.com (2603:10a6:102:13f::16)
 by AS2PR08MB8927.eurprd08.prod.outlook.com (2603:10a6:20b:5fa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.21; Fri, 24 Nov
 2023 16:45:34 +0000
Received: from PAXPR08MB6750.eurprd08.prod.outlook.com
 ([fe80::542e:1889:d107:2e96]) by PAXPR08MB6750.eurprd08.prod.outlook.com
 ([fe80::542e:1889:d107:2e96%4]) with mapi id 15.20.7025.021; Fri, 24 Nov 2023
 16:45:34 +0000
Message-ID: <66dc0fbc-0898-4597-92a4-489050cb1b1c@arm.com>
Date: Fri, 24 Nov 2023 16:45:34 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [Discussion]: Enhance virtio rpmsg bus driver buffer allocation
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
 linux-remoteproc@vger.kernel.org
References: <1af16ff8-5706-45e5-9737-05da39957c95@arm.com>
 <7eb830b3-e915-4151-ae10-46ce7cd68fa1@arm.com>
 <b98f58a2-6627-4e8a-9466-4f6276cfd0b3@foss.st.com>
Content-Language: en-US
From: Divin Raj <divin.raj@arm.com>
Cc: "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>
In-Reply-To: <b98f58a2-6627-4e8a-9466-4f6276cfd0b3@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0605.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:314::7) To PAXPR08MB6750.eurprd08.prod.outlook.com
 (2603:10a6:102:13f::16)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB6750:EE_|AS2PR08MB8927:EE_|AMS0EPF00000197:EE_|GV2PR08MB9206:EE_
X-MS-Office365-Filtering-Correlation-Id: 016e9029-e924-4f53-ceaa-08dbed0cccff
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 VMOOPi1KcevKV44mIhuFl45UKVgaDUWXUuCFQbPjx/zKDPIS7GlI/5FTrxUKlnzVT/z1wzmarb3b9L3jv6uqjQoy8P0G3uI22k3I9iMFM3XLpkkw5TfdwKz0F4aKU3e/mic/m3oze8JVMEoFGY7w2ckFKQQPMgV8nQMzxoC7ntO8FRXw8hisK4ScsSFCV5zcWv5Y6C/EOzAjwfTknH8NC1rL5vLoLx+hOeacma2FUPut3Co2QM74PetAYM72NAwiLb81DkznP95PuHnovatMo/4kzP2J/X0TWqgDJ0fBYNgaYuMDZZMl5iUqrx5OtsblxtmqnrPutBmPzWdziEJ2nX8Tan9vst3L8VAhVXWixuaft9Z1PDZhyK1kX1Hhcio+4K6JQ60cf/AZXnoesQA8l3Mrqe1QVkHtSIrt83OfipcppAEI4cPlc2+vPDizqxTLOkUrEkU3uqy6N19KwNgTu2Ud2q0C+Bwm3ln57bIMqnDdlBdEf5XRo/zLfOIxaSf+gs5q2iNbISt16YqH5W+ScdzQZC4NTr8uFXqBBc7iIVsNll+82ISuLoxm+VpBqAmPwKzwfXOKBl8KJI+1sgiC0lVRAwnuzqoOTGZkkxSkyf7S4xOzddaZjcYUJaVwI03paoEy1toLhIXEAEDPAi8aN/CKYRiYApWbA17r14zZIgxllzhOYhlJBFj4XuiT2N4S
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6750.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(376002)(346002)(39860400002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(31686004)(83380400001)(26005)(2906002)(66946007)(66476007)(66556008)(8676002)(966005)(2616005)(4326008)(8936002)(316002)(38100700002)(44832011)(6486002)(478600001)(5660300002)(53546011)(66899024)(36756003)(41300700001)(31696002)(6506007)(6512007)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8927
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	59bce4a0-ca1e-4d55-1114-08dbed0cc75f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	h1EHe69azDyhyGoYWFYOjILpWWevLn76QzB/18B/fSDXz6Qlyi+g9N93eferN2u05svkBrEMO7O4CgdnCSiANKXUOjgXeX96KLDaZYugjpOZhYFX/Rkd10sN8Jx7Tz4mc61vlgJh008PfVY68VqqXotAWhpSy8rdbabC6hQbeEAIK+EgUzQK1ilVXR6dSfyWO46drfPffqNDxQ0rjiiI6sadFqs1OmwLenQGQ4a9xirfPDt86T18iQRUJR2bkbVGOpazLgNLsJHF3GRCqmq4MCE4OR2CA7N5JfQmZ95sahv3To43fiTUVOl1kv7EFR3DgSSlL6mQUzMec7e/XZ6fvNc5zTzEITIhhWY9sATGXoLOshYtUvq9Y0CLSZvkHAy/ueBKwuIzkhf5YXiXz/wu9p31cS1JrQDG0z6vL21QTZHJhn6eLyOe/oReRB2ATVpO5A6Suc4lFZlSYBsvQWOWnAq/kADUyR99UyXd4enZKcP2s+c7Dm4xetCK/QVlaB5M9sqjGz+NAticx8KpGmLRfp8BZeXZwGi3eVBaGu79oDvvSHJdNefvIcHhXpdmjH40i3v9QxOGbqTZYHy/CE1cv/FKo3MfQZ8kMtMqb38EaUUYc2/IGJ/AQZ3rVkzoEXWm2tOj4gu4y1+MvXks5PKLdkrg8kdoVlMlihzI2iWBzU8RaKm6QmMXMcC4bfRLLIqkhHXVWJ81XaR95QGDNpfWYqUyPEKvfNnGiRSedQsuImbdoYgjdRUHHzlaDQBXyvqSYX5aLlDFD5snmTJShmFyC7mAUaTxEj8GD7Kzp80/z2s=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(1800799012)(82310400011)(451199024)(64100799003)(186009)(46966006)(40470700004)(36840700001)(5660300002)(2906002)(44832011)(4326008)(41300700001)(8676002)(8936002)(316002)(70586007)(70206006)(478600001)(6506007)(6486002)(966005)(53546011)(31686004)(26005)(2616005)(40480700001)(6512007)(66899024)(83380400001)(40460700003)(47076005)(336012)(36860700001)(82740400003)(81166007)(356005)(31696002)(86362001)(36756003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 16:45:43.7139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 016e9029-e924-4f53-ceaa-08dbed0cccff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000197.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9206

Hi Arnaud,
Please find my comments inline.

On 11/20/23 10:14 AM, Arnaud POULIQUEN wrote:
> Hi Divin,
>
> On 11/17/23 23:24, Divin Raj wrote:
>> On 10/23/23 11:44 AM, Divin Raj wrote:
>>> Hello all,
>>>
>>> I am reaching out with reference to the patch discussed here: Enhanced
>>> virtio rpmsg bus driver buffer allocation.
>>> <https://lore.kernel.org/all/CAH2Cfb-sv3SAL8bcczC-Dc3_r58MYZCS7s7zGtn1Q=
fo3mmBqVg@mail.gmail.com/>
>>>
>>> I've been keenly following the developments around enhancing buffer
>>> allocation strategies, especially those focused on dynamic buffer sizin=
g
>>> and the considerations for systems under varying memory constraints.Thi=
s
>>> work is highly relevant to several projects I am involved in, and I am
>>> quite interested in its progression. May I kindly request an update on
>>> the current phase of these initiatives? Additionally, I am eager to kno=
w
>>> if there would be an opportunity for me to contribute to enhancing the
>>> patch, possibly by working on improvements or assisting in verification
>>> processes.
>>>
>>> Furthermore, if there are any condensed resources, summaries, or
>>> specific threads that encapsulate recent advancements or discussions on
>>> this topic, I would be grateful to receive directions to them.
>>>
>>> I appreciate everyone's dedicated efforts and invaluable contributions
>>> to this area of development. Looking forward to the updates.
>>>
>>> Regards Divin
>>>
>> Hello Linux Community,
>>
>> In one of our internal projects, we encountered a challenge with RPMSG
>> buffer allocation. Our goal is to optimize memory allocation for an
>> out-of-tree RPMSG Ethernet device driver using virtio. This is to ensure
>> support for packet sizes matching the standard MTU (Maximum Transmission
>> Unit) size of 1500 bytes.
>>
>> To mitigate this issue, There are few possible solutions:
>>
>> 1. Configure buffer size and number through Kconfig.
>> 2. Permit the firmware creator to determine the most suitable value from
>>    the resource table.
>> 3. Enable independent configurations on both ends. This approach would
>> support both dynamic and fixed buffer configurations using a generic
>> allocator.
>>
>> Reference:
>>
>> [1]:
>> https://lore.kernel.org/all/1548949280-31794-4-git-send-email-xiaoxiang@=
xiaomi.com/
>> [2]: https://lore.kernel.org/all/20190701061353.GE1263@builder/
>>
>>
>> Draft Design Overview:
>>
>> Based on the reference patch and the discussions, we have outlined the
>> following key points for the belw design:
>>
>> 1. Assure compatibility, enabling both Linux and the remote system to
>> interchangeably transmit and receive messages, irrespective of size.
>> 2. For systems with constrained shared memory:
>> Systems with small, shared memory, we need to deal with a
>> limited/optimized memory chunk. To avoid memory fragmentation, the
>> allocator should have a pre-reserved buffer pool
>> 3. The implementation should ensure that the remote side does not
>> receive messages based on its allocation parameters.
>>
>> do you think it could make sense?
>>
>> High level view:
>> +------------------+                               +------------------+
>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Linux       |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Remote      |
>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |
>> |=C2=A0=C2=A0 +----------+   |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +----=
-------------+     |=C2=A0=C2=A0 +----------+   |
>> |=C2=A0=C2=A0 |=C2=A0=C2=A0 RPMSG  |=C2=A0=C2=A0 | <---> | Buffer Alloca=
tor|<--->|=C2=A0=C2=A0 | RPMSG    |=C2=A0=C2=A0 |
>> |=C2=A0=C2=A0 +----------+   |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | (Dy=
namic/Static)|=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 +----------+   |
>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +--=
---------------+     |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> +------------------+                               +------------------+
>>
>>
>> Detailed view:
>>
>>                    +-------------------------+
>>                    |=C2=A0 Message Creation       |
>>                    |=C2=A0 (Both Linux/Remote)    |
>>                    +------------+------------+
>>                                 |
>>                                 v
>>                    +-------------------------+
>>                    | Determine the allocation|
>>                    | strategy                |
>>                    +------------+------------+
>>                                 |
>>                  +--------------+--------------+
>>                  |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>> +-------------------------------+  +-------------------------------+
>> | Dynamic allocation            |=C2=A0 | Static allocation             =
|
>> | (Buffer allocator allocates   |=C2=A0 | (Pre-reserved memory          =
|
>> | memory space as needed,       |=C2=A0 | space)                        =
|
>> | based on the current          |=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
>> | message requirement )         |=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |
>> +-------------------------------+  +-------------------------------+
>
> Do you have a proposal for dynamic allocation?
>
> RPMSG is based on the virtio protocol. The virtio driver in the Linux ker=
nel
> is responsible for allocating buffers for the virtio device on the remote=
 processor.
>
> In the current implementation (static allocation) the Linux
> kernel allocates predefined buffers for the remote processor.
>
> How would you manage the fact that the sender allocates its own buffers a=
nd
> references
> them in the vring descriptor? This would require each core to have
> a dual role, right?
> - a virtio driver role on its TX vring
> - a virtio device role on its RX vring."
>
I'm unsure if a dual role is feasible under the Virtio specification.
However, would it make sense to set the size of the outbuf based on the
Maximum Transmission Unit (MTU) size that is supported? Additionally,
the size of the inbuf could be set by the firmware, suggesting that it
should be derived from the resource table. With this approach, I believe
the sender can decide the maximum size.

Regards
Divin

>
> Regards,
> Arnaud
>

>
>>
>> We would greatly appreciate any feedback, suggestions, or improvements
>> you could provide.
>>
>> Thank you for your time and consideration.
>>
>> Regards
>> Divin
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
