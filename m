Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98396C072A2
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Nov 2023 22:24:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234364AbjKQWYd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 17 Nov 2023 17:24:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234558AbjKQWYc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Nov 2023 17:24:32 -0500
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2049.outbound.protection.outlook.com [40.107.13.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B35D4F
        for <linux-remoteproc@vger.kernel.org>; Fri, 17 Nov 2023 14:24:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=EQOc1cKBTQNVeWxw71/WzNR4QIB59htPgKKMi9Dtbmk35JnbgtSXEpKOtaUIIjitgTDoe4Vxp1RX5Kkjy8q3XBGpiPTuQiZn4CEWv0Ae43A9UDkK+ktvplP7KhoeEUwez28D6KWNTcoopPw8mTmJPgnpD8FIe9kFQd0tujzpb1YFrWaxE2DTyfWAQmmOeBZvewF8AQs9iYWU6ndnVGo8tJ13XAfj2abGwA5/86as5hoWZPXkSALcJVxWyu/BKIjNA9fRmCZZdz9gyNJ577fawfAee9EB6kKvNdgseJCeaMHfyOguqqymJkexIJdirxRX4AP/LYLN/SysVLxKDxNpyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hen06T5dotv9pghdQJCLa3uHZZdDPqweQPx6ZpQlNtk=;
 b=IipuMkN3ynFlYhZGN+WWPIbaa5UQKO8qyfeiP8Q2UTpJW3s9D9a5ZJ77cVrqimGJceE9pFdoa46QjaHUYtr2u3NnuaoQ5cXJp1Rp2Ei1y0rhd3tgyGimqhmhSW2nWa6flvW4iT3WFCw+Type1PcsQEwBAXpXSoNu+FzvPuJ7ZY9dSEYYkgKngV/I5qzwbTYOoLSKuYJpgNeAZSECiSHiczqLr2dk9XgiJB1Bnorfeo90I13YXi8qWoZaNX2/zZTaSZA4pT0Y51Q3HGbSoPs4vtxwYILtxkLtEbiA79XkT9Ud0PhtKcvMNSqwUgSftMjb6eVHIEm+TozgDlccXaiiPg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hen06T5dotv9pghdQJCLa3uHZZdDPqweQPx6ZpQlNtk=;
 b=TSr+WsxP/MO2xoCI+W1fjCd/5HQKIrE3orQlSOmwcno5Wf98CROqwBhrwWoTjthyWPkE5m/eAqeXVCg7THPidseyQ9+oR+YYC/mjN2CUDKgDdO7WF12b5R/uqNI0Aq+MtwyqAK3+vD23bws6XsXFxASelwfygLalQjyZVPZNcN8=
Received: from DUZPR01CA0352.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::15) by AS2PR08MB9548.eurprd08.prod.outlook.com
 (2603:10a6:20b:60b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 22:24:24 +0000
Received: from DU6PEPF0000B61B.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::45) by DUZPR01CA0352.outlook.office365.com
 (2603:10a6:10:4b8::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 22:24:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61B.mail.protection.outlook.com (10.167.8.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.13 via Frontend Transport; Fri, 17 Nov 2023 22:24:24 +0000
Received: ("Tessian outbound 8289ea11ec17:v228"); Fri, 17 Nov 2023 22:24:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8e15aaf325e2ad47
X-CR-MTA-TID: 64aa7808
Received: from d7151ff8ec87.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 1231BB00-05C7-4A69-88F9-AB7033755D31.1;
        Fri, 17 Nov 2023 22:24:18 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d7151ff8ec87.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 17 Nov 2023 22:24:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBJO9vmqxKZcUT4stMvAb2y4OX1j3CHAOdsdgAkncqkmAuN/yTYpxYJQEwkdQxvntFVyWSvm4C9KF+sEDSS0tPpbZdP6ubn+84FIvj6QI6NoAXe3qcVlGypLW2WWndDmvdULHqMhw5MCHzZW6T9n7owjjLSdKFLNHTRETKzir7HGveUx1+1rjDKDV+S6Ybq/OvPS0ahKd50tXSjRPJPjGYkeTDdcXru8uX6DwrIE0rF5e8yb/LBI5Md0k71S0pK9h4eSSIxN8fkYrIf/j0clqSOfBomqXsJtp5C5aefWyfQRs+ZntcHChyAm9ahrbGu4xoAxs6KWJmfyP7JYRw2Qsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hen06T5dotv9pghdQJCLa3uHZZdDPqweQPx6ZpQlNtk=;
 b=a9FunKQyAtCW0lvkN6WiVkVj1hwZWt885MGPaLARkCPeq7iW4I5BZH97VmjZfoPjjVl/Lr0N/yi82eeWmc6dkxYVJBgBXEhooS1etBt9l0ZJlgFFD8REfwAjoDNANTw/Fh736p7GgUBFY6yvxfX6ikl6vBNCr7TsAJFOckWPqwoXzvOjlcDG5udNQKzMJ78rE5YpQ/FVGHtxXjd05nFDz4ZossrPf0/HDx8RGCm5ExTWOwf7/rWx61LqWUMBO6mVhDrsgvfrMSzmP07wMuQy9wfcLQTN2a9efyfoX3NXxuxUwg756RgZgA8KD7WZzTfUXEIrJM5ZNvmyT1uVDIvUXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hen06T5dotv9pghdQJCLa3uHZZdDPqweQPx6ZpQlNtk=;
 b=TSr+WsxP/MO2xoCI+W1fjCd/5HQKIrE3orQlSOmwcno5Wf98CROqwBhrwWoTjthyWPkE5m/eAqeXVCg7THPidseyQ9+oR+YYC/mjN2CUDKgDdO7WF12b5R/uqNI0Aq+MtwyqAK3+vD23bws6XsXFxASelwfygLalQjyZVPZNcN8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAXPR08MB6750.eurprd08.prod.outlook.com (2603:10a6:102:13f::16)
 by AS4PR08MB7688.eurprd08.prod.outlook.com (2603:10a6:20b:507::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 22:24:16 +0000
Received: from PAXPR08MB6750.eurprd08.prod.outlook.com
 ([fe80::542e:1889:d107:2e96]) by PAXPR08MB6750.eurprd08.prod.outlook.com
 ([fe80::542e:1889:d107:2e96%4]) with mapi id 15.20.7002.022; Fri, 17 Nov 2023
 22:24:16 +0000
Message-ID: <7eb830b3-e915-4151-ae10-46ce7cd68fa1@arm.com>
Date:   Fri, 17 Nov 2023 22:24:20 +0000
User-Agent: Mozilla Thunderbird
Subject: [Discussion]: Enhance virtio rpmsg bus driver buffer allocation
Content-Language: en-US
From:   Divin Raj <divin.raj@arm.com>
To:     linux-remoteproc@vger.kernel.org
References: <1af16ff8-5706-45e5-9737-05da39957c95@arm.com>
In-Reply-To: <1af16ff8-5706-45e5-9737-05da39957c95@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO6P123CA0050.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::6) To PAXPR08MB6750.eurprd08.prod.outlook.com
 (2603:10a6:102:13f::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: PAXPR08MB6750:EE_|AS4PR08MB7688:EE_|DU6PEPF0000B61B:EE_|AS2PR08MB9548:EE_
X-MS-Office365-Filtering-Correlation-Id: a85bc047-cd86-4bac-095a-08dbe7bbf447
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: K3F2aAMh8rDqkK//b5JSROdovnEeNaMBWAYpwXXd62e5qnqXtASBKKF/6tNbO1m1TaCW0qmrfoI7EEPGavNXa+/uBuKaGCAx8xhfOVFDGvtiroz7B05HOlqgeoyyCgCX9JVlIGnC1WbP94LVgUL/cELkSzDZ1L71O5bXvdwCZ/R5eyu3d9jNiG8f04V4bQyeuiiA17upP4VtZ/afMN2r7CNjCxHSikJbCrePg4ubdm/2U7QGwx5dtoNGSWUwNdjAQo7D7rPfKWznCBY+JTgkYtpOdxX8HnV8fWjuIK4rP5C5sLhuFPnoPolfomBdFBwXHtxAtXmdfxmbGSBGCiWOuwmmIWgjoLJc6GvDVNcR9IGwz/qw7xNijlwGzsxje2kKQcHl0wPTKMG8aW4o0UMAJDRw+AVJngZ9teGUVe7xvXUD9IGzLTAYPsx76CwtWf6hYJK7B+4PW+LevEYSaZApbEoBLD9ZRhJJfOU11I51nVRpVuVttC/RwX7Ko2ZFyPU6x70XF6boAgWBijyy1nobJsHa7k89IZRvAsa8/SS35e7wlk9XoidTewPGLq/5Rg7BIMd4YIJ42rdq9TuCyq/USW5/jJSr6L2+A30uNGEuiOGtsnW5/75KC6iVmaN6peIS09P1gs+gdYgo+VzqOf9fpctK5r5X/sEDxndbpuRc5RBqqpjJpbCfcKfrxmJfvmME
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6750.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(366004)(136003)(376002)(346002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(2616005)(41300700001)(6666004)(86362001)(38100700002)(6486002)(966005)(6512007)(478600001)(36756003)(6506007)(53546011)(31686004)(31696002)(26005)(2906002)(66556008)(66946007)(316002)(6916009)(66899024)(83380400001)(5660300002)(8676002)(8936002)(66476007)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7688
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: bcf5bfba-848f-4a98-13ad-08dbe7bbef52
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jTXn9t2GK0uHktY69pF1IXBciyW6nmVQuiQBKvp7UPMNARmTill4QPGJery0S9RWDvDjONtWScSXO3G+L37ZzZgWs9k3TmXVhEwHBn5APfqs3bIvSqEcKjeW3htC3PIUdIIFxgxuO28J2kJwCq3vYFPf6H0UopcyQM+PGE1pZfAj5DiFOa5/0WYm8v3jUiW6nVylFMh80mqigHXHwPIwTu85dYK9qJTs6mRjpQp5ndBg4NmIGx5WaqxDaZqqqboo0igtO5/y/taCeBkwzkOtzzXIBqyF9x4kxcr93LfBvwcOCCRDjdiJQRz/z7sz9ctB/Z+m8/qxGUGqudkbmzFZqtI/s2AJvviFN1Ko4IhBM/IPCoRoeG828bm0zt/8UXLsACl8ClBmQk8jyaNsAg+QfPcBSy2w9Ue+p2cYzNGgWaBIEYkyNBfVDB3ckyTeKnkD8Osum5aahWO+lw6zNExda2flYWiMxHTauua2lZ0E1RkcuJ+3fNWYqhJUY+pAb9y7RxgVZDuGTpXqJmV+0/7Yalef+UZ4Svg+2gyxW/WCQqLM2/qvv9vURYAhB3IVqAabc+Jg/rHPdsFvnSeoYetjocTm6mN/6MAZ+B0bg0E/JnBWOxD8EeC1E7vc2hP4JX8tz8sAwBOZL9ER8dl4QRxosBTmJgsouA29lZ2LM54Kr7ukwPiwEG79gNoFoiJcVwgEXJ5OajX2DOLYZFy0kWTFJ8kWz87kO75aAvsdTl69vVHqNVw44sjMgr/gpvDGNWwT5y4xnL4Mlj2uYyjTvHG/8rX3qzXEun6gC8bcXE1wdoo=
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(376002)(39860400002)(136003)(230922051799003)(64100799003)(82310400011)(1800799009)(186009)(451199024)(46966006)(40470700004)(36840700001)(47076005)(26005)(6506007)(82740400003)(8676002)(5660300002)(44832011)(36860700001)(8936002)(2906002)(2616005)(40480700001)(70586007)(53546011)(31696002)(6666004)(86362001)(70206006)(31686004)(36756003)(66899024)(40460700003)(6916009)(478600001)(6512007)(6486002)(966005)(316002)(336012)(41300700001)(83380400001)(356005)(81166007)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 22:24:24.6097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a85bc047-cd86-4bac-095a-08dbe7bbf447
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9548
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 10/23/23 11:44 AM, Divin Raj wrote:
> Hello all,
>
> I am reaching out with reference to the patch discussed here: Enhanced
> virtio rpmsg bus driver buffer allocation.
> <https://lore.kernel.org/all/CAH2Cfb-sv3SAL8bcczC-Dc3_r58MYZCS7s7zGtn1Qfo=
3mmBqVg@mail.gmail.com/>
>
> I've been keenly following the developments around enhancing buffer
> allocation strategies, especially those focused on dynamic buffer sizing
> and the considerations for systems under varying memory constraints.This
> work is highly relevant to several projects I am involved in, and I am
> quite interested in its progression. May I kindly request an update on
> the current phase of these initiatives? Additionally, I am eager to know
> if there would be an opportunity for me to contribute to enhancing the
> patch, possibly by working on improvements or assisting in verification
> processes.
>
> Furthermore, if there are any condensed resources, summaries, or
> specific threads that encapsulate recent advancements or discussions on
> this topic, I would be grateful to receive directions to them.
>
> I appreciate everyone's dedicated efforts and invaluable contributions
> to this area of development. Looking forward to the updates.
>
> Regards Divin
>
Hello Linux Community,

In one of our internal projects, we encountered a challenge with RPMSG
buffer allocation. Our goal is to optimize memory allocation for an
out-of-tree RPMSG Ethernet device driver using virtio. This is to ensure
support for packet sizes matching the standard MTU (Maximum Transmission
Unit) size of 1500 bytes.

To mitigate this issue, There are few possible solutions:

1. Configure buffer size and number through Kconfig.
2. Permit the firmware creator to determine the most suitable value from
   the resource table.
3. Enable independent configurations on both ends. This approach would
support both dynamic and fixed buffer configurations using a generic
allocator.

Reference:

[1]:
https://lore.kernel.org/all/1548949280-31794-4-git-send-email-xiaoxiang@xia=
omi.com/
[2]: https://lore.kernel.org/all/20190701061353.GE1263@builder/


Draft Design Overview:

Based on the reference patch and the discussions, we have outlined the
following key points for the belw design:

1. Assure compatibility, enabling both Linux and the remote system to
interchangeably transmit and receive messages, irrespective of size.
2. For systems with constrained shared memory:
Systems with small, shared memory, we need to deal with a
limited/optimized memory chunk. To avoid memory fragmentation, the
allocator should have a pre-reserved buffer pool
3. The implementation should ensure that the remote side does not
receive messages based on its allocation parameters.

do you think it could make sense?

High level view:
+------------------+                               +------------------+
|                  |                               |                  |
|      Linux       |                               |      Remote      |
|                  |                               |                  |
|   +----------+   |       +-----------------+     |   +----------+   |
|   |   RPMSG  |   | <---> | Buffer Allocator|<--->|   | RPMSG    |   |
|   +----------+   |       | (Dynamic/Static)|     |   +----------+   |
|                  |       +-----------------+     |                  |
+------------------+                               +------------------+


Detailed view:

                   +-------------------------+
                   |  Message Creation       |
                   |  (Both Linux/Remote)    |
                   +------------+------------+
                                |
                                v
                   +-------------------------+
                   | Determine the allocation|
                   | strategy                |
                   +------------+------------+
                                |
                 +--------------+--------------+
                 |                             |
+-------------------------------+  +-------------------------------+
| Dynamic allocation            |  | Static allocation             |
| (Buffer allocator allocates   |  | (Pre-reserved memory          |
| memory space as needed,       |  | space)                        |
| based on the current          |  |                               |
| message requirement )         |  |                               |
+-------------------------------+  +-------------------------------+

We would greatly appreciate any feedback, suggestions, or improvements
you could provide.

Thank you for your time and consideration.

Regards
Divin
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
