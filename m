Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51B6C4332F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 23 Dec 2022 10:56:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiLWK4t (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 23 Dec 2022 05:56:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiLWK4s (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 23 Dec 2022 05:56:48 -0500
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2130.outbound.protection.outlook.com [40.107.255.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27AE837F86
        for <linux-remoteproc@vger.kernel.org>; Fri, 23 Dec 2022 02:56:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ksfgrxf3OacToKW0ggGo5fHt/O9x2TfG2A8aDlccRi8nDRvWkSrTQCne5mZ481VZPdoyTPMq9RLQtMdl0ko4/6Pbv5Krehj2PUKeTq2xp9r0tkhU7mJPUU1870TyLLDaaVLHzr2Qf5ZXzrDNqGZ1q5negfb2/6DFlhuABdhpiTy1xPiCbU/lIrtsE3pmEdQ803Q9g5+dItP+1i/PXJlRt1tYMfBjHJVs77dtXPIYveqd6iVEnQ7VxMCtq17iHLtDSK4hp26O+56jRPmPMfxJyYLCy0hz3pbth1vT4MmF7p530XR4uQcI6UiZwJyhYQQdygaplKXzWI5UYBz76Y/o7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ambLeYDC46FVotplHxge9EtnVSGSAYjMzDKcwDwtxd8=;
 b=K+/WyvVq+qggKzrSr1vEqThObMORNG2vcv3h2nWYrpjHJjeCQHJVqLzDWsmqNGYh4u5hbS3UCY8OWav7w60HNQWGgnAjixDOmgX84H9si3KyqvslmY+PPOBNsekAmfBbokfegedyKqkyMi/g/YVCUNKXon7t8WUKE5lzj6y0jFKE9oQDkxFG4+sRBNBMyF/1mhq4tsu/bFwNrJyXP1ABWHYbVKL8DKHGlqhuBZh2Kb2EmkCR5X9jbow/12y5d5lPp9njtu/P3pREz17c3tModNRs2xSs0Hi6xCqZGcQ0We1dI0TLb8yzkJA4hVF+OuHfC2QXfhhkSXDWbLJj/4tMZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 103.192.253.182) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=zeku.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=zeku.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zeku.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ambLeYDC46FVotplHxge9EtnVSGSAYjMzDKcwDwtxd8=;
 b=3g6xjoEFrCudUD7uPn+01i0VGKIfTo63dp45ueAHOecVzlRJBgdLR1edm5EjQqJyJuZ0spVIUFpBumLkfmLBl/Kr4b8cijk4T/gpj0JYzFNvcNcrjAb5nnI++HIIGMUNmHcrDnFxB0GdfnFp/Ivq/2USu0jbD/w7tlDHyrzLgwm+BC58xIssL6ztOyGGTancz5ylzm6wAvMq+t9J652IBWpsR+2J+CcQ8mt8uIVX/NVIHRlbZ5NSLPnFzghDRXtTQ5d25AOQcb0Z7c/ue2G1QKM5BX0OEEx+ixExFt9gi/BeWxwEn/yR51ecHqeMCkWJq5coi3yb+6zlAJTOM4POSw==
Received: from SL2P216CA0173.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b::13)
 by TY2PR02MB4464.apcprd02.prod.outlook.com (2603:1096:404:8008::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.13; Fri, 23 Dec
 2022 10:56:43 +0000
Received: from PSAAPC01FT064.eop-APC01.prod.protection.outlook.com
 (2603:1096:101:1b:cafe::82) by SL2P216CA0173.outlook.office365.com
 (2603:1096:101:1b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.13 via Frontend
 Transport; Fri, 23 Dec 2022 10:56:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 103.192.253.182)
 smtp.mailfrom=zeku.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=zeku.com;
Received-SPF: Pass (protection.outlook.com: domain of zeku.com designates
 103.192.253.182 as permitted sender) receiver=protection.outlook.com;
 client-ip=103.192.253.182; helo=sh-exhtc2.internal.zeku.com; pr=C
Received: from sh-exhtc2.internal.zeku.com (103.192.253.182) by
 PSAAPC01FT064.mail.protection.outlook.com (10.13.38.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.13 via Frontend Transport; Fri, 23 Dec 2022 10:56:42 +0000
Received: from sh-exhtc4.internal.zeku.com (10.123.154.251) by
 sh-exhtc2.internal.zeku.com (10.123.21.106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.12; Fri, 23 Dec 2022 18:56:41 +0800
Received: from sh-exhtc3.internal.zeku.com (10.123.154.250) by
 sh-exhtc4.internal.zeku.com (10.123.154.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5;
 Fri, 23 Dec 2022 18:56:41 +0800
Received: from sh-exhtc3.internal.zeku.com ([fe80::9d06:be36:aea8:90f7]) by
 sh-exhtc3.internal.zeku.com ([fe80::9d06:be36:aea8:90f7%9]) with mapi id
 15.02.0986.005; Fri, 23 Dec 2022 18:56:41 +0800
From:   =?gb2312?B?1cKwwihaaWNoYXIgWmhhbmcp?= <zhangao@zeku.com>
To:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: Problems in remote-proc when iommu enabled
Thread-Topic: Problems in remote-proc when iommu enabled
Thread-Index: AdkWvC+g4fD/94gjQTiN8bKHMgNWFQ==
Date:   Fri, 23 Dec 2022 10:56:40 +0000
Message-ID: <22430358eba24a4598bbc780a9e44680@zeku.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.122.47.130]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAAPC01FT064:EE_|TY2PR02MB4464:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bed7f21-6f65-461e-d43d-08dae4d4604d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ume+46A7ADelwWyVLFe7+NBMGy4OynXGqjNelMFsAFSFHZvdStSB6mcLQvNKa5vLxDsLzzpNJkkWFG9d/xiHqi89CJIwr5cSuT02CK3e4i0Gq3ixZSQptC79kZ7Y5Bd+BFnZ35zkXwiQBmMZMQdJtGc9y2qMuxextwdkD+1Gj+v7arkrxknQURJ3f2LRBu9bDEYpjhGQ3jyX9Qd/f0bnG7Gdhz8dlh/VFzgep51egrUDJSUGypg6pg5cZcCH7GZ7jNSIoAkzksZB7IOsngSDUoFwCDXyFjWgC+Eoqei0WmXz4Mvl5uGVwdpRkriiKpdhASEYlQtyTiRG7LM0jCBLtf9muxc1yEaftG2S13VqLhwHtXnKyco1WUsv8iGdCSaD1gM4H+Ah0sz0p/Y54uzTzPGJclZOCY1EaHH3JFhjG37QfOFlmeo7KxLmjHYUiR/Cz2IvHibbTMfwGch5oFzBH0XIdA0tl2vmbKCL6mEWpiK/v5khPCVYhUv7+oOJ82yTgW/WM5NMT0+gJBsGOdLxrFe6GSxXfPegFcSNrbkEc7B3cGM83F668MxJR9kQaiomr96Xq47jX0W/fEh3/uoPPPyGCNbU7J7oycpNQb+IQWuJObFKild/EiL0hq/IlZnxXES2AXjNg6Z+l0uTBD8Ylk66AJ2CB1H9D6+HV9GjyOw9a/8C/rXQfIW1zeuh5MI5xd7KATQ9bEqGpIRejb0R740xaq32u9YseTN3oFeAMik=
X-Forefront-Antispam-Report: CIP:103.192.253.182;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:sh-exhtc2.internal.zeku.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39840400004)(346002)(396003)(376002)(136003)(451199015)(36840700001)(46966006)(36860700001)(110136005)(41300700001)(336012)(36756003)(8936002)(47076005)(426003)(5660300002)(83380400001)(85182001)(316002)(40480700001)(2906002)(2616005)(8676002)(70206006)(70586007)(86362001)(82310400005)(186003)(26005)(356005)(108616005)(24736004)(478600001)(7696005)(81166007)(36900700001)(36394005);DIR:OUT;SFP:1102;
X-OriginatorOrg: zeku.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2022 10:56:42.5009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bed7f21-6f65-461e-d43d-08dae4d4604d
X-MS-Exchange-CrossTenant-Id: 171aedba-f024-43df-bc82-290d40e185ac
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=171aedba-f024-43df-bc82-290d40e185ac;Ip=[103.192.253.182];Helo=[sh-exhtc2.internal.zeku.com]
X-MS-Exchange-CrossTenant-AuthSource: PSAAPC01FT064.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR02MB4464
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

SGkgcmVtb3RlLXByb2MgdGVhbaOsDQoNCk15IG5hbWUgaXMgWmljaGFyIFpoYW5nLCBJIGNvbWUg
ZnJvbSBDaGluYSwgQW5kIEknbSB3b3JraW5nIGluIGEgbWljcm9jaGlwDQpjb21wYW55IG5hbWVz
IFpFS1UuIE91ciBmaXJzdCBwaG9uZSBjaGlwIHByb2R1Y3Qgd2FzIG5vdCB5ZXQgYW5ub3VuY2Vk
Lg0KKEFvIFpoYW5nIGlzIG15IENoaW5lc2UgbmFtZSkNCg0KSSBhbSB3b3JraW5nIG9uIG91ciBz
dWJzeXN0ZW0gZHJpdmVycyB1c2luZyByZW1vdGUtcHJvYyBmcmFtZXdvcmsuIFRoZQ0KcmVtb3Rl
LXByb2MgZnJhbWV3b3JrIHdvcmtzIHdlbGwuIEJ1dCBpZiBJIGVuYWJsZWQgaW9tbXUsIHRoZXJl
IGFyZSBzZXZlcmFsDQpwcm9ibGVtcyBjb21lcy4NCg0KVGhpcyBlbWFpbCBpcyBhc2sgZm9yIGhl
bHAgaWYgeW91IGhhdmUgc29tZSBpZGVhcyBmb3IgdGhlc2UgcHJvYmxlbXMuDQpJIHdpbGwgbGlz
dCB0aGUgcHJvYmxlbXMgYW5kIG1ha2UgdGhlbSBzaG9ydC4NCg0KRmlyc3QgaXMgdGhlIGJhY2tn
cm91bmQgYW5kIHJlcXVpcmVtZW50IGZvciBvdXIgc3Vic3lzdGVtOg0KMS4gVGhlICJzcmFtIiBp
biBzdWJzeXN0ZW0gaXMgdG9vIHNtYWxsIGFuZCB3ZSBoYXZlIHRvIGxvYWQgc29tZSBkYXRhcyBm
cm9tDQpmaXJtd2FyZSBmaWxlIHRvIEREUi4NCjIuIFdlIHVzZSAidnJpbmcgJiBycG1zZyIgYXMg
dGhlIElQQyB0b29sIHRvIGNvbW11bmljYXRlIHdpdGggc3Vic3lzdGVtLg0KSSB1c2UgInZyaW5n
IiBzdWItZGV2aWNlIG1lY2hhbmlzbSBpbiByZW1vdGUtcHJvYy4NCjMuIFRoZXJlIGlzIGFuIGFk
ZHJlc3Mgb2Zmc2V0IGJldHdlZW4gImxpbnV4IiBhbmQgc3Vic3lzdGVtIGluIG91ciAiU09DIi4N
CndoaWNoIG1lYW5zICJsaW51eCIgYW5kIHN1YnN5c3RlbSByZWFkL3dyaXRlIHRoZSBzYW1lIERE
UiBtZW1vcnkgdGhyb3VnaA0KZGlmZmVyZW50IGFkZHJlc3MsIHRoZXJlIGlzIGEgbGluZWFyIG9m
ZnNldCBiZXR3ZWVuIHRoZW0uDQoNCkkgdGhpbmsgaXQncyBhIGNvbW1vbiBjYXNlIHdpdGhvdXQg
YXJjaGl0ZWN0dXJlIGRpZmZlcmVuY2VzLg0KDQpUaGUgZmlyc3QgcHJvYmxlbSBpcyByZW1vdGUt
cHJvYyB1c2UgaW9tbXUgYXBpIHdpdGggYSBuZXcgYWxsb2NhdGVkIGlvbW11DQpkb21haW4gd2hl
biAidnJpbmcgJiBycG1zZyIgZHJpdmVycyB1c2luZyBkbWEgYXBpLg0KVGhhdCBtYWtlcyB0aGUg
bWVtb3J5IGFkZHJlc3Mgc2VwYXJhdGVseSBhbmQgY2FuIG5vdCB0YWtlIGVmZmVjdCBhdCB0aGUg
c2FtZQ0KdGltZS4gVGhleSBhcmUgbm90IHNoYXJpbmcgdGhlIHNhbWUgcGFnZSB0YWJsZS4NClNv
IEkgZG8gbm90IHVzZSB0aGUgImlvbW11IiBjb2RlIGluIHJlbW90ZS1wcm9jIGZyYW1ld29yaywg
d2hpY2ggbWVhbnMgSQ0KY2FuJ3QgdXNlICJjYXJ2ZW91dCBoYW5kbGUiIGluc2lkZSB0aGUgZGVm
YXVsdCAicmVzb3VyY2UgdGFibGUiIGhhbmRsZSBmdW5jdGlvbi4NCkkgYmluZCBpb21tdSB0byBv
dXIgcGxhdGZvcm0gZGV2aWNlIGFuZCByZXdyaXRlIHRoZSAiY2FydmVvdXQgaGFuZGxlIiB1c2lu
Zw0KZG1hIGFwaSB0byBhbGxvY2F0ZSBhbmQgbWFwIG1lbW9yeS4NCkJ1dCB3aHkgbm90IHJlbW90
ZS1wcm9jIGZyYW1ld29yayB1c2UgdGhpcyBzb2x1dGlvbiBqdXN0IGxldCB1c2VycyBiaW5kaW5n
IHRoZWlyDQppb21tdSBkZXZpY2UgaWYgdGhleSBuZWVkIGFuZCB1c2UgZG1hIGFwaSBhcyB0aGUg
c2FtZSBhcGkgInZyaW5nICYgcnBtc2ciIHVzZS4NCg0KVGhlIHNlY29uZCBwcm9ibGVtIGlzIHRo
ZSAiZGV2IiBwYXJhbWV0ZXIgd2UgcGFzc2VkIHRvICJ2cmluZyAmIHJwbXNnIiBkcml2ZXJzLg0K
VGhlcmUgYXJlIGZvdXIgbGV2ZWwgImRldmljZSIgaW4gcmVtb3RlLXJwcm9jOiBwbGF0Zm9ybSBk
ZXZpY2UsIHJwcm9jIGRldmljZSwgcnZkZXYNCmRldmljZSBhbmQgdmRldiBkZXZpY2UuIFJlbW90
ZS1wcm9jIHBhc3MgdGhlIHJ2ZGV2IGRldmljZSBhcyB0aGUgImRldiIgcGFyYW1ldGVyDQp0byAi
dnJpbmcgJiBycG1zZyIgZHJpdmVycywgd2l0Y2ggYWxzbyBtYWtlcyAic2VwYXJhdGUgcGFnZSB0
YWJsZSIgY2F1c2UgcmVtb3RlLXByb2MNCnVzZXMgcGxhdGZvcm0gZGV2aWNlIGFzICJkZXYiIHBh
cmFtZXRlciBwYXNzZWQgdG8gZG1hIGFwaS4NCkFsdGhvdWdoIHRoZXkgY29weSB0aGUgImRtYSBt
YXNrcyIgYW5kICJkbWEgb3BzIiBmcm9tIHBsYXRmb3JtIGRldmljZSB0byBydmRldg0KRGV2aWNl
LCBidXQgdGhhdCdzIG5vdCBlbm91Z2gsIGFuZCBJIHRyaWVkIHRvIGZpeCB0aGlzIGJ1dCBJIGZh
aWxlZC4NClNvIEkgaGF2ZSB0byByZXdyaXRlIHRoZXNlIGNvZGVzIGFuZCBwYXNzIHBsYXRmb3Jt
IGRldmljZSB0byAidnJpbmcgJiBycG1zZyIgZHJpdmVycy4NCg0KVGhlIGxhc3QgcHJvYmxlbSBi
b3RoIGV4aXN0IHdoZXRoZXIgaWYgSSBlbmFibGUgaW9tbXUgb3Igbm90Lg0KV2UgaGF2ZSBhIG1l
bW9yeSBvZmZzZXQgYmV0d2VlbiAibGludXgiIGFuZCBzdWJzeXN0ZW0gaW4gb3VyICJTT0MiIGFz
IEkgbWVudGlvbmVkDQpiZWZvcmUuIEFuZCBpZiBJIHVzZSAiZG1hLXJhbmdlcyIgYXR0cmlidXRl
IGluIGRldmljZXRyZWUsIGFuZCBkbWEgYXBpIHdpbGwgY29ycmVjdCB0aGUNCm9mZnNldCBpbiBh
bGxvY2F0aW5nIGFuZCBtYXBwaW5nIHByb2Nlc3MuIEJ1dCBpdCBpcyBub3QgaGFwcGVuZWQuDQpJ
biBmdW5jdGlvbiAidnJpbmdfbWFwX29uZV9zZyIsIHRoZSBkbWEgb3BlcmF0aW9uIHdhcyBza2lw
cGVkISEgKHZpcnRpb19yaW5nLmMpDQpDYXVzZSAidnEtPnVzZV9kbWFfYXBpIiBmbGFnIHdhcyBu
b3Qgc2V0IGluIHRoZSBpbml0aWFsaXplIGZ1bmN0aW9uIHdpdGNoIHJldHVybmVkIGJ5DQpmdW5j
dGlvbiAidnJpbmdfdXNlX2RtYV9hcGkiLg0KKFRoZXkgc2FpZCBpdCBzaG91bGQgYmUgInF1aXJr
IiBpZiBkbWEgYXBpIHdhcyB1c2VkIGluIHZyaW5nLiBJIGRvbqGvdCB1bmRlcnN0YW5kLiBBbmQg
aWYNCnVzZXJzIGRvIG5lZWQgdGhpcyBmdW5jdGlvbiwgSSBzaG91bGQgc2V0IFZJUlRJT19GX0FD
Q0VTU19QTEFURk9STSBmbGFnIHdoaWNoIGlzDQozM2JpdCBpbiB0aGUgdmlydGlvIGZlYXR1cmUg
ZmxhZ3MsIEJ1dCB0aGUgZmVhdHVyZSBmbGFncyBpbiByZXNvdXJjZSB0YWJsZSBpcyAzMmJpdCBs
ZW5ndGghKQ0KSSBkbyBub3Qga25vdyBob3cgdG8gaGFuZGxlIHRoaXMgYW5kIHRoaXMgIm9mZnNl
dCIgc2hvdWxkIGJlIHRyYW5zcGFyZW50IGZvciBzdWJzeXN0ZW0NCnJpZ2h0PyBDYXVzZSB0aGUg
bWVtb3J5IGNvdWxkIGJlIGNoYW5nZWQgaW4gdGhlIG5leHQgZ2VuZXJhdGlvbiBvZiBvdXIgIlNP
QyIuDQoNClRoYXQgaXMgYWxsIHRoZSBwcm9ibGVtIEkndmUgZ290IGluIG91ciBwcm9qZWN0Lg0K
VmVyeSBhcHByZWNpYXRlIGlmIHlvdSBoYXZlIHNvbWUgY29tbWVudHMgZm9yIHRoZXNlLg0KDQpC
ZXN0DQpaaWNoYXINCg0KWkVLVQ0K0MXPorCyyKvJ+cP3o7qxvtPKvP6w/Lqs0MXPornpt6K8/sjL
y/nU2tfp1q9aRUtVy/nT0KGjIL371rnIzrrOyMvU2s60vq3K2siotcTH6b/2z8LS1MjOus7Qzsq9
o6iw/MCotauyu8/e09rIq7K/u/Kyv7fWxfvCtqGiuLTWxrvytKuypaOpyrnTw7D8uqy1xNDFz6Kh
o8j0xPq07crVwcuxvtPKvP6jrMfrwaK8tLXnu7C78tPKvP7NqNaqt6K8/sjLo6yyosm+s/2xvtPK
vP68sLi9vP6how0KSW5mb3JtYXRpb24gU2VjdXJpdHkgTm90aWNlOiBUaGUgaW5mb3JtYXRpb24g
Y29udGFpbmVkIGluIHRoaXMgbWFpbCBpcyBzb2xlbHkgcHJvcGVydHkgb2YgdGhlIHNlbmRlcidz
IG9yZ2FuaXphdGlvbiBaRUtVLiBBbnkgdXNlIG9mIHRoZSBpbmZvcm1hdGlvbiBjb250YWluZWQg
aGVyZWluIGluIGFueSB3YXkgKGluY2x1ZGluZywgYnV0IG5vdCBsaW1pdGVkIHRvLCB0b3RhbCBv
ciBwYXJ0aWFsIGRpc2Nsb3N1cmUsIHJlcHJvZHVjdGlvbiwgb3IgZGlzc2VtaW5hdGlvbikgYnkg
cGVyc29ucyBvdGhlciB0aGFuIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocykgaXMgcHJvaGliaXRl
ZC4gSWYgeW91IHJlY2VpdmUgdGhpcyBlbWFpbCBpbiBlcnJvciwgcGxlYXNlIG5vdGlmeSB0aGUg
c2VuZGVyIGJ5IHBob25lIG9yIGVtYWlsIGltbWVkaWF0ZWx5IGFuZCBkZWxldGUgaXQuDQo=
