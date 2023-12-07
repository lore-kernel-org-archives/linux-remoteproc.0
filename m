Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="YZjY2Rm6";
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.b="YZjY2Rm6"
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2078.outbound.protection.outlook.com [40.107.22.78])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7FD810C9
	for <linux-remoteproc@vger.kernel.org>; Thu,  7 Dec 2023 04:47:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=YL3f8bUmryCcm22kx6Ix8Kgfmv7RC0UFPGu7itK2yJKuO1Pl24kdM4ap/Vxwoer2dwV2tPD2ouHKcqSbNrJH5j4nA9bPz3Uy5m28BkQCArNntyKxC+ycvpm35zyz8FM7Qg+lsFkiTg8PAjqXP5iCpP4svz4ch4WhhgChZs2E9skVW+TsEvUStcBKjuwZJovPSMr2Sp5jE9W1tsdPLs5p/g0V036k276a73das084+0zj18uRq4219FvrNDrfWB0cO6p+jPULhL1lt48vDoGgpr/NYxv3Sykoprs87AI/E3JXS1ojbWXTOgUkjuAN8AFd7PsKa4H9dwmSy4wiTkcmnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eo5OWmFamkCIpMUvjh5gM9CWTRX4P8+1IIKaCLawoxQ=;
 b=h4s8ijH4DaLM3PSmx9P8S4Ws8rPfvNaw7mRTyvt7VDbE3bf/XdVtkXOol/MV007WwTgdIDeTOsSfjCzSp7Pr2brRjdP+Cpm+xVu84Uz/HgjRhtR5RaKt+h6cC05fmJAgERPCsjcZEiPnPIpkUXsqASDBd12+Yafcpa7rNUk9Ur4W2Mv8HoX+dtCOXxxvxEA92geKpiVh4R5XHAty/r6ykqF2lnBIFEams8SRdYbu+w2WNwcwOFZ4hSV/IMHyWgttY6yrU1xsz95yMDdCDe5xK4aH5eeKlxm/ObaeicFxgesctgq9yVxuidK7dnZOsdnP9uHVAc9+rQXK+7/mLSN70g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eo5OWmFamkCIpMUvjh5gM9CWTRX4P8+1IIKaCLawoxQ=;
 b=YZjY2Rm6wld2+uQ7AcqAPwKwocqvL1fpf+bBZ0+gaFQKG49G0133/tH1daq/KslTlrGSiIS7xUV4TCCPhYfyioD2+Unu3se5yHoO53+jGgfzdkRG/AUItukBHdbTTavZybwv7y10BfLQeeV2v1czPk76zy9DNb52hc+NTObPBEo=
Received: from AM6PR0202CA0049.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::26) by DU2PR08MB10130.eurprd08.prod.outlook.com
 (2603:10a6:10:493::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.26; Thu, 7 Dec
 2023 12:47:19 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:3a:cafe::7c) by AM6PR0202CA0049.outlook.office365.com
 (2603:10a6:20b:3a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Thu, 7 Dec 2023 12:47:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Thu, 7 Dec 2023 12:47:18 +0000
Received: ("Tessian outbound 5d213238733f:v228"); Thu, 07 Dec 2023 12:47:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 222234e46e2fd58f
X-CR-MTA-TID: 64aa7808
Received: from 1d1dc13fd916.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id E40D22C3-0447-47AD-AAFD-55540541BA36.1;
	Thu, 07 Dec 2023 12:47:07 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1d1dc13fd916.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 Dec 2023 12:47:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ai6fnarOcevHLtnkeKyWAxfzuPR0BJCTBXJOmEPfLCFzXW7/8HaAAlRiU7NUDKbQdA+uPFGEPs5PClE/MWqxBRBSkg2ZYMgIy4vcqNZDoDnROIwjAzSPjdGUnasGC2CeNoxJKkU21HGFE1zLCIvfxw/VLmKZ2ZpVJmgHi8eCgCXxS6F945keQTiL5dKo2GQCFemus+e9RZjaFkT8so/TfXrvvzJsLuS0webNOdNYd33KU3lgGvkAwPy7XP3V9IZwx45nnineKyqRf78AGIiBc79UyrYC7nxu2ZsWDd0BULp1UmCVEwf2FxiNXjNxJ/4ngnlgMRgqZEqHRXLV8VhxNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eo5OWmFamkCIpMUvjh5gM9CWTRX4P8+1IIKaCLawoxQ=;
 b=RZrwlecgsQy61FYq70rIG4w18AmBAFqVRoBO1MTDON9oSceXYpTgBugmid6PXxhDYZggl10m6sUse8GIidgbByZXW6/IDgF16MPD85B1B/wLwg+j8G8XAkIbJrPOqn9pBI6yTrtvhBdTMbZrIrMqMx6qgaoVTmx/HJdq44EetMsoChavm6wgnOu7lCs/dzW0QMV2WS2NqAUhCVL6IT+nHM1LWHgndCjUhky/ih/wIskGYIwA2gMO4w1Zf43kfl6c+x64TlLd0G/HbilqacvntBGbI8LQC1J9fPkLPOYsTF9NFKUwWkZcaszZadP/DQt+gsRSajhcua3edybWeQCMUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eo5OWmFamkCIpMUvjh5gM9CWTRX4P8+1IIKaCLawoxQ=;
 b=YZjY2Rm6wld2+uQ7AcqAPwKwocqvL1fpf+bBZ0+gaFQKG49G0133/tH1daq/KslTlrGSiIS7xUV4TCCPhYfyioD2+Unu3se5yHoO53+jGgfzdkRG/AUItukBHdbTTavZybwv7y10BfLQeeV2v1czPk76zy9DNb52hc+NTObPBEo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAXPR08MB6750.eurprd08.prod.outlook.com (2603:10a6:102:13f::16)
 by DU0PR08MB9935.eurprd08.prod.outlook.com (2603:10a6:10:401::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 12:47:03 +0000
Received: from PAXPR08MB6750.eurprd08.prod.outlook.com
 ([fe80::542e:1889:d107:2e96]) by PAXPR08MB6750.eurprd08.prod.outlook.com
 ([fe80::542e:1889:d107:2e96%4]) with mapi id 15.20.7068.027; Thu, 7 Dec 2023
 12:47:03 +0000
Message-ID: <f55f4823-c4e6-4034-8d2c-d933efe1177c@arm.com>
Date: Thu, 7 Dec 2023 12:47:02 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [Discussion]: Enhance virtio rpmsg bus driver buffer allocation
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
 linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>
References: <1af16ff8-5706-45e5-9737-05da39957c95@arm.com>
 <7eb830b3-e915-4151-ae10-46ce7cd68fa1@arm.com>
 <b98f58a2-6627-4e8a-9466-4f6276cfd0b3@foss.st.com>
 <66dc0fbc-0898-4597-92a4-489050cb1b1c@arm.com>
 <3f0b831b-eda0-44c4-ad1b-1d4958d90ecd@foss.st.com>
 <80b61579-4dc5-4e43-924e-edd6ebd514e9@arm.com>
 <38ea2aee-a7b6-4461-a2e8-c809dfa725a4@foss.st.com>
Content-Language: en-US
From: Divin Raj <divin.raj@arm.com>
In-Reply-To: <38ea2aee-a7b6-4461-a2e8-c809dfa725a4@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0505.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::15) To PAXPR08MB6750.eurprd08.prod.outlook.com
 (2603:10a6:102:13f::16)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB6750:EE_|DU0PR08MB9935:EE_|AM2PEPF0001C714:EE_|DU2PR08MB10130:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eeb1734-65fa-4de3-b0f7-08dbf722a5dd
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Ep86qU+MZoIYyEKTcZQBUvTCR94daAVWnSHG+FsyGNgfc9vhH7Bn8ozPBh5vH4SSP18a/921LIya3B+mT7D8en1DcNAzdRL9h7hUlVDX8PbupCNAt39sp+befcBw6Q/F8j9YaQI6wLexKk1nhk2ZAjuM8gRgalSDyQTeBZq9jQMya9jvFMd41N7o5wOwa0hVpJJ52QjkQm6dFDj9Nx33FLWtbFB1tm9gCkmRrwFkkDnx1SW7ReZl2Y5MAR7L1w8bC6cqI12G+w+KR0q4B+NkLgAnm3B4Pgww4qsfntvti7L+wiR2VT8sJKpS2FNp+pgIIceZy9dov5kDWWKztC7m6a9cb3lnH4ZTd7O1qaYZnIaFjVvW0JcVN7PT5hWw8NE81z3DMSZSLcBocqzIg+Xxs/OTy3lGY5GTGz7jwyV+4XWM1p4PkEpmrBHG0E57uUEtJnLMFxQq7Yrya4fxGQ8pSu083Q4letQCE11t3CBEQav28FVJdN1UFb93q+LdSWNs48/2yPnZQHjkgiFCc+Gn2U4kvPxWUXR0DR2LQrgXuaRrgDqqcMKnYnzncadQ9WTLp8CmfKZMkGD/JfDhx7wk+flyrK2YownFW4FeOx0mw06WXVnLHXMisGXSFOuElRnlFNOXRm+rnAkjByb7epZ8BIcdzN+23PH1cHfqNIV2qJ9kn8ho3JGBS1DhV+GWwJ7g
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6750.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(39860400002)(396003)(346002)(376002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(66899024)(6512007)(6506007)(66556008)(2616005)(53546011)(83380400001)(110136005)(26005)(66476007)(316002)(66946007)(86362001)(44832011)(4326008)(8676002)(8936002)(478600001)(966005)(6486002)(38100700002)(31696002)(31686004)(36756003)(41300700001)(2906002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9935
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b2773f87-15ea-4a31-5503-08dbf7229cd5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oybdq2IEp9kV7UM6JyJIRnFIv3VMuLZZasoSR9ucmSsvVT4EqEAl9o/E250LtuQ7J8tXvBZQ7cySBMi4s9FrYewSduzI0WADebfUIU+Rd4LlggxLMe2UC/rbpp4htmd1gVWDwVuxBK13HAevjqAXYBk92wxRvndmllJz7QbR1opygjxEPDX+XrBg3MBBC3q8JQ6yM48ahFgKsWc1zeY4/D24wCpXBrTJlcJFod8ladVKnpeNOxpDuTHsUiKA7R1jkX0DE04dMfy3OlDAn3K+y+qIKIsdydLJry0qSq3hSGPQvarYbwrWi5q4MQQeD96QuGora4UZM5mzerG05hPofrRfW+1bPIQDTZK05GKiP0WPvTdpSvnq5zYMYgXVZP5vZpDU36ychA2Z1+85qnNApJBcXzfs6sd56yV/BIGQmbtuPzX3qKgiPfBbVdsTL+3FZISfMgn0zYBM2s0LLMYar6ZdlBpjdR2f0UOge0EdGVX+kt6UMfGM84VyG/ZTkuEBoxIeDe5ayVDc96USDVipTkqyhGfPK/pPCz+T1N/jfuBPqdtdiRIqlJ4/FLx3XuzD1DJG8FpPaVhkxhgNc3ISV2FAPuus6C084bbHnmW77Rurlooi/95pAG3eokx0exbJknOnDppEt8BOSPBDsaaeYQpTX9zntET1+pS5mDqmRBR1V/f5Z625S9zfn8IAWqYj9mZUN+UYFAw4Gd5lnIMrpmqltKwujT8VtcHmPs86BacdLsRIk09WNfYVU8k4xFq5P5fHFLhWicg1by5UTsvdIA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(396003)(376002)(346002)(136003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(82310400011)(36840700001)(46966006)(70206006)(70586007)(36860700001)(110136005)(40480700001)(4326008)(8676002)(6486002)(966005)(478600001)(31686004)(356005)(53546011)(6512007)(82740400003)(8936002)(26005)(336012)(2616005)(44832011)(316002)(6506007)(81166007)(86362001)(5660300002)(31696002)(2906002)(83380400001)(47076005)(36756003)(41300700001)(66899024)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 12:47:18.6150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eeb1734-65fa-4de3-b0f7-08dbf722a5dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10130

On 11/28/23 1:45 PM, Arnaud POULIQUEN wrote:
>
>
> On 11/28/23 12:19, Divin Raj wrote:
>> On 11/28/23 8:34 AM, Arnaud POULIQUEN wrote:
>>>
>>>
>>> On 11/24/23 17:45, Divin Raj wrote:
>>>> Hi Arnaud,
>>>> Please find my comments inline.
>>>>
>>>> On 11/20/23 10:14 AM, Arnaud POULIQUEN wrote:
>>>>> Hi Divin,
>>>>>
>>>>> On 11/17/23 23:24, Divin Raj wrote:
>>>>>> On 10/23/23 11:44 AM, Divin Raj wrote:
>>>>>>> Hello all,
>>>>>>>
>>>>>>> I am reaching out with reference to the patch discussed here: Enhan=
ced
>>>>>>> virtio rpmsg bus driver buffer allocation.
>>>>>>> <https://lore.kernel.org/all/CAH2Cfb-sv3SAL8bcczC-Dc3_r58MYZCS7s7zG=
tn1Qfo3mmBqVg@mail.gmail.com/>
>>>>>>>
>>>>>>> I've been keenly following the developments around enhancing buffer
>>>>>>> allocation strategies, especially those focused on dynamic buffer s=
izing
>>>>>>> and the considerations for systems under varying memory constraints=
.This
>>>>>>> work is highly relevant to several projects I am involved in, and I=
 am
>>>>>>> quite interested in its progression. May I kindly request an update=
 on
>>>>>>> the current phase of these initiatives? Additionally, I am eager to=
 know
>>>>>>> if there would be an opportunity for me to contribute to enhancing =
the
>>>>>>> patch, possibly by working on improvements or assisting in verifica=
tion
>>>>>>> processes.
>>>>>>>
>>>>>>> Furthermore, if there are any condensed resources, summaries, or
>>>>>>> specific threads that encapsulate recent advancements or discussion=
s on
>>>>>>> this topic, I would be grateful to receive directions to them.
>>>>>>>
>>>>>>> I appreciate everyone's dedicated efforts and invaluable contributi=
ons
>>>>>>> to this area of development. Looking forward to the updates.
>>>>>>>
>>>>>>> Regards Divin
>>>>>>>
>>>>>> Hello Linux Community,
>>>>>>
>>>>>> In one of our internal projects, we encountered a challenge with RPM=
SG
>>>>>> buffer allocation. Our goal is to optimize memory allocation for an
>>>>>> out-of-tree RPMSG Ethernet device driver using virtio. This is to en=
sure
>>>>>> support for packet sizes matching the standard MTU (Maximum Transmis=
sion
>>>>>> Unit) size of 1500 bytes.
>>>>>>
>>>>>> To mitigate this issue, There are few possible solutions:
>>>>>>
>>>>>> 1. Configure buffer size and number through Kconfig.
>>>>>> 2. Permit the firmware creator to determine the most suitable value =
from
>>>>>>      the resource table.
>>>>>> 3. Enable independent configurations on both ends. This approach wou=
ld
>>>>>> support both dynamic and fixed buffer configurations using a generic
>>>>>> allocator.
>>>>>>
>>>>>> Reference:
>>>>>>
>>>>>> [1]:
>>>>>> https://lore.kernel.org/all/1548949280-31794-4-git-send-email-xiaoxi=
ang@xiaomi.com/
>>>>>> [2]: https://lore.kernel.org/all/20190701061353.GE1263@builder/
>>>>>>
>>>>>>
>>>>>> Draft Design Overview:
>>>>>>
>>>>>> Based on the reference patch and the discussions, we have outlined t=
he
>>>>>> following key points for the belw design:
>>>>>>
>>>>>> 1. Assure compatibility, enabling both Linux and the remote system t=
o
>>>>>> interchangeably transmit and receive messages, irrespective of size.
>>>>>> 2. For systems with constrained shared memory:
>>>>>> Systems with small, shared memory, we need to deal with a
>>>>>> limited/optimized memory chunk. To avoid memory fragmentation, the
>>>>>> allocator should have a pre-reserved buffer pool
>>>>>> 3. The implementation should ensure that the remote side does not
>>>>>> receive messages based on its allocation parameters.
>>>>>>
>>>>>> do you think it could make sense?
>>>>>>
>>>>>> High level view:
>>>>>> +------------------+                               +----------------=
--+
>>>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Linux       |=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Remote      |
>>>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>> |=C2=A0=C2=A0 +----------+   |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=
-----------------+     |=C2=A0=C2=A0 +----------+   |
>>>>>> |=C2=A0=C2=A0 |=C2=A0=C2=A0 RPMSG  |=C2=A0=C2=A0 | <---> | Buffer Al=
locator|<--->|=C2=A0=C2=A0 | RPMSG    |=C2=A0=C2=A0 |
>>>>>> |=C2=A0=C2=A0 +----------+   |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
 (Dynamic/Static)|=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 +----------+   |
>>>>>> |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
+-----------------+     |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>> +------------------+                               +----------------=
--+
>>>>>>
>>>>>>
>>>>>> Detailed view:
>>>>>>
>>>>>>                      +-------------------------+
>>>>>>                      |=C2=A0 Message Creation       |
>>>>>>                      |=C2=A0 (Both Linux/Remote)    |
>>>>>>                      +------------+------------+
>>>>>>                                   |
>>>>>>                                   v
>>>>>>                      +-------------------------+
>>>>>>                      | Determine the allocation|
>>>>>>                      | strategy                |
>>>>>>                      +------------+------------+
>>>>>>                                   |
>>>>>>                    +--------------+--------------+
>>>>>>                    |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |
>>>>>> +-------------------------------+  +-------------------------------+
>>>>>> | Dynamic allocation            |=C2=A0 | Static allocation         =
    |
>>>>>> | (Buffer allocator allocates   |=C2=A0 | (Pre-reserved memory      =
    |
>>>>>> | memory space as needed,       |=C2=A0 | space)                    =
    |
>>>>>> | based on the current          |=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |
>>>>>> | message requirement )         |=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |
>>>>>> +-------------------------------+  +-------------------------------+
>>>>>
>>>>> Do you have a proposal for dynamic allocation?
>>>>>
>>>>> RPMSG is based on the virtio protocol. The virtio driver in the Linux=
 kernel
>>>>> is responsible for allocating buffers for the virtio device on the re=
mote
>>>>> processor.
>>>>>
>>>>> In the current implementation (static allocation) the Linux
>>>>> kernel allocates predefined buffers for the remote processor.
>>>>>
>>>>> How would you manage the fact that the sender allocates its own buffe=
rs and
>>>>> references
>>>>> them in the vring descriptor? This would require each core to have
>>>>> a dual role, right?
>>>>> - a virtio driver role on its TX vring
>>>>> - a virtio device role on its RX vring."
>>>>>
>>>> I'm unsure if a dual role is feasible under the Virtio specification.
>>>
>>> At least, it does not seem to align with the philosophy of VirtIO.
>>>
>>>
>>>> However, would it make sense to set the size of the outbuf based on th=
e
>>>> Maximum Transmission Unit (MTU) size that is supported? Additionally,
>>>> the size of the inbuf could be set by the firmware, suggesting that it
>>>> should be derived from the resource table. With this approach, I belie=
ve
>>>> the sender can decide the maximum size.
>>>
>>> It is not clear to me what your proposal is.
>>> Are you speaking about a pre-allocated buffers as proposed in [1],
>>> or are you speaking about dynamic allocation of the RPMsg in a pool?
>>
>> we are at the initial phase of this investigation. As we previously
>> discussed, option 3 is not feasible in accordance with the virtio
>> specification.The above proposed solution aligns with [1], suggesting
>> preallocated in_buf and out_buf, with sizes determined from the resource
>> table and MTU. By allowing Linux to decide the out_buf size and the
>> remote to decide the in_buf size, I believe we can avoid conflicts. If
>> everyone agrees on a common idea, then it would be a good starting point
>
> Thanks for the clarification. It seems reasonable to me to start with a
> pre-allocated buffer with a fixed size specified by the remote firmware.
>
> Bjorn, Mathieu,
> Please, could you share you point of view on the topic?
>
+ Bjorn
+ Mathieu

> Thanks,
> Arnaud
>
>>
>> Regards
>> Divin
>>
>>> Regards,
>>> Arnaud
>>>
>>>>
>>>> Regards
>>>> Divin
>>>>
>>>>>
>>>>> Regards,
>>>>> Arnaud
>>>>>
>>>>
>>>>>
>>>>>>
>>>>>> We would greatly appreciate any feedback, suggestions, or improvemen=
ts
>>>>>> you could provide.
>>>>>>
>>>>>> Thank you for your time and consideration.
>>>>>>
>>>>>> Regards
>>>>>> Divin

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
