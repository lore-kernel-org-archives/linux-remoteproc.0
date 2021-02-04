Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F367C43381
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Feb 2021 16:02:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85CB764F70
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 Feb 2021 16:02:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237730AbhBDQCP (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 Feb 2021 11:02:15 -0500
Received: from mail-bn8nam11on2055.outbound.protection.outlook.com ([40.107.236.55]:61541
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237238AbhBDPVk (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 Feb 2021 10:21:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oaQL92vQt0TXQys23yy4CLeWJEAhaOgDjAE7yc5ZXOCcwUJvfue8z5iyxM8U4QvscaL1w5WGD/e21IHpQu8vI9YYv6EUBE3QCQz4tvsguExk2E3GpYRPemVenuhSZciHN69H2H0FvUruIdPhuvKFejT4Iz1uw4LUOn7GzO9ofDk1+TJQDqkmvBm4n+akrkx+u9/0dSruM5rk0IMTVH9RxS4AIJtvYIqZi02gai1apKnKlYwFlyyj04xKK2xJWaypLhgChXsb3ba0FP6YfnZvaDXCSxiNdWY/DhWZmIAyYrP3tsoWzCgO1sbNp97yLq0uizi0sEOjGRkIkatGVAileQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rI/n8GCSMjTUSLYZeVemOltzLXLCZ0bdSj6CtszUkyo=;
 b=jwBishYcR3OmcrmBN1hw98+x/Rar4NMvSOFl1Zen62GB7brOzn1oRrP+iikSbWkvjBe1VH0csXBzQIzbynPWGVbrU2n8GPWR+4sOSm9CLSur1QmQdZTsHH3zYsAm5mDkAtgtRCx9swgZSv413fFxeSWxeOI5T7R+NrVhIxoOQtFeFlGNIkcyIMLgoe/P8PxwVYSjX0YvHkf0Uc30iuS98yAZWCG52rIL6ZPo9ttP4NlQkM6O0BBE2cCSwxYeocUXQS50b9SHDi6DT+5XcImfsEKYuicn2jnCDh0lm/WJtWU+JG7R+8MmfClON1Wh4xeGwO0WwD/58xby83A5G1OnFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rI/n8GCSMjTUSLYZeVemOltzLXLCZ0bdSj6CtszUkyo=;
 b=clmoX9yC2NSkyi06LcW0YqbzsM9EIyAEWdwVLJ6cs96yLn+Uv24HosDnZ1O11p4tDhKawa0rPoXSMn/jb92MT637FmfKEwa0nbvduK/3UW6/XP8fNKC5LJr/xvmuA2MouTxCFWzGF6YK+9oqgTOVJuX4RzG0ojqFi2UQOnh/4jM=
Received: from BYAPR02MB4407.namprd02.prod.outlook.com (2603:10b6:a03:55::31)
 by SJ0PR02MB7727.namprd02.prod.outlook.com (2603:10b6:a03:31b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Thu, 4 Feb
 2021 15:20:47 +0000
Received: from BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::2cf3:79d2:d169:7fdb]) by BYAPR02MB4407.namprd02.prod.outlook.com
 ([fe80::2cf3:79d2:d169:7fdb%3]) with mapi id 15.20.3805.025; Thu, 4 Feb 2021
 15:20:47 +0000
From:   Ben Levinsky <BLEVINSK@xilinx.com>
To:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Subject: RE: [PATCH v25 0/5] Provide basic driver to control Arm R5
 co-processor found on Xilinx ZynqMP
Thread-Topic: [PATCH v25 0/5] Provide basic driver to control Arm R5
 co-processor found on Xilinx ZynqMP
Thread-Index: AQHW574q0e+WqOBv5UeooFVJINcPq6pIQv+w
Date:   Thu, 4 Feb 2021 15:20:47 +0000
Message-ID: <BYAPR02MB44074420E51EAB13ACDAA343B5B39@BYAPR02MB4407.namprd02.prod.outlook.com>
References: <20210111020250.6846-1-ben.levinsky@xilinx.com>
In-Reply-To: <20210111020250.6846-1-ben.levinsky@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [24.5.142.107]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 37b98b3b-1c40-46e6-6c8a-08d8c92072ef
x-ms-traffictypediagnostic: SJ0PR02MB7727:
x-microsoft-antispam-prvs: <SJ0PR02MB7727C7D33E4E1C21362D6E27B5B39@SJ0PR02MB7727.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Dwc5EiU9SSELiuf9DmZKYo2XEe2Po0vbA0+gJ/8YE+KKuyTn78yxYZavBL+qVsBY0UIz6CpoOoTWu/YnRiemdEfMTXIgc3IK6wf6wQBmy4AMhu/hnkOj95NUr6zR5xejQZWesHcZ12jHZAPSqqAlTStIGi8jw2ryHxxhO9rVGkkvR05Tg8NpwwAbsNRxflYBjxCqMtqtklykg4fMT4sdkjHmH9GPjfqDda9nqVxWQ6MiiIj9TZ5vMQJZxRo8/VtRwDIP2mZBRbnU8GkQ7sdE2AnVmlVLTv7G/it8rFUxPWhvepwmUac13aFZiGHErX1QIIi/UrQLs8pAcmW+Qf98AQCaomKwqw3DluuUEIbTFBZ6USzenxxuglL//mIQt2m9Rcy8WoDPmNcyt9bVopq8dPL1LldBccSlP3GnbPFO2JXzXtpYc2YfG05C0QsIC7m3kfeN4FLWcLfhS4QelZcVEfKsvODPyu1KMa22D04QK/isVOO+4PDgRvjzywRouziMT9d2ZRecH/Nq8QW3Vq/VxiiH3yMJw7ZNhpCIcMCqxl9RTkRkS+N4VI8PIxfL9rOIHHM9E2/+nkhO3fjJheLLvkkgDhsJkFnOjejRUu8DqaM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR02MB4407.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39850400004)(136003)(346002)(366004)(396003)(478600001)(6916009)(76116006)(66446008)(66556008)(2906002)(26005)(966005)(86362001)(53546011)(71200400001)(7696005)(8676002)(6506007)(64756008)(9686003)(83380400001)(55016002)(66476007)(66946007)(52536014)(316002)(5660300002)(186003)(8936002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?TPD888w9Nl3tyTdzXpMeHiqbcw2wy0LbEMNdB523YxObYfEKEbP7/9gEn9UG?=
 =?us-ascii?Q?R/3aJDY1q3FP3yPo9c1wFOzEENyY3amkkYuw5PnHHKu/wAVq0FtyvfJsQZYz?=
 =?us-ascii?Q?qWXHRRE76/mk7cV7TVkBXdW0T3eXMl+a11w4bkmlYbZVZSyufqeoRuC2TMzx?=
 =?us-ascii?Q?Q5nA+kEALW4tToVY9kHdDdG+sqEFjUx+giLTl+agCmalfMwTq5Bjr2uXKt+r?=
 =?us-ascii?Q?M7Q4JuUFUd5jAV/iJEoPYN0V8kbIjaI2zS0W0cCZxoUFpzVvDTM5im9l4YXd?=
 =?us-ascii?Q?PKHbMGNuAEIi9GlCCUroXeE178aHJA2x+aFEHT29pACYcVknekdEYJ8TdTys?=
 =?us-ascii?Q?zUYTYCWpvbxtTHp1sRV+IGU1pHYKnwoQJ8CQ9+7n11karDOpZC0+JTXO0jC8?=
 =?us-ascii?Q?tBuG2twd5dZz1jsDAJcn6Jksqjaib291V8mc+LxBj5ZRgbeCwVB4f87i/S29?=
 =?us-ascii?Q?0MZU+lUaBM3mwEjfCuucrGSnP1DgSKFWWmCOWaCCe+eil2sHdN483dnZ5jDA?=
 =?us-ascii?Q?ZzjdHzIaFciB+hImxKcQ9kjFFCZL4QEAxigHbvB+BWQ+5PQ+2iatWp0wgQo9?=
 =?us-ascii?Q?MoPsz+3q4EBEVhRJUdZiNYPZWw/QH7GPCOyHmKX+bJ1ETGHWRo/oeRVRdOzH?=
 =?us-ascii?Q?5r9OwwWUwxHShXsmF4Vm/rjpLm9G8JGEkDzXuo/WWHy/VNghgdAgs2xOiYiD?=
 =?us-ascii?Q?iW3YTKx7KmJ2fqAKP3h/z3PPii9wPYs55keSrkMBJC0CoykfE5BF6mJJWewg?=
 =?us-ascii?Q?4CgOkvaI4NdhBJvPZev/RsAV6faTx0Bf1Ks+xbVIYktu3SK3+4LVggbCQVqx?=
 =?us-ascii?Q?6kXkMmLWjJCh/sRSw5wiC1DAv+Ku9ShXG/9fiR6CTTCQcibIMRBoDGkyFrto?=
 =?us-ascii?Q?wy1oXXbdR5UOKWvHMMoL79sMl15FLCb3Fx30p1/8aqDVzbptkfDRIv/CytXm?=
 =?us-ascii?Q?e7Fy7VZYgR//cICcp/ZLCj2lf60WQ2mN0sdfHvaDWis7xWhrXGQDxXzDMDc/?=
 =?us-ascii?Q?tMlG2XZz6RBmaWNgIfaiENI2Pn6YrSo1PmqD2Ei2YjmkIQetBISeYs1sMi21?=
 =?us-ascii?Q?r9w6PES45kh3MIIoy/8kRpmsAj1HgtNBfwU0hQhufHnlcPMjhGLkgjKv0LW6?=
 =?us-ascii?Q?SNV+jmvaPrz1MRYfOuTd9azVpS8a/2zswvak08iu0iGbj0ne/iQ2V9qjK9x9?=
 =?us-ascii?Q?KEKBX7PqJxU7JwgEO1LfnbthI7hbrsxxMgkZGrgoJkgrwVd+y3WagUNJg0QG?=
 =?us-ascii?Q?CO/Rr4TLdYayAMpA9Gi4w7Eufco+LSWtKT8uQEotIINer/3sO7x0RKf7Ncay?=
 =?us-ascii?Q?V2g=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4407.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b98b3b-1c40-46e6-6c8a-08d8c92072ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2021 15:20:47.6585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lyNX250Sns0uljgSA/MDXKyRwBp73sRVdHBG2FI0zz7361NMnUEp+ypD6pewrIDyzyQPE3lzO3kPyJ+jzzjIGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7727
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Ping for comments

> -----Original Message-----
> From: Ben Levinsky <ben.levinsky@xilinx.com>
> Sent: Sunday, January 10, 2021 6:03 PM
> To: mathieu.poirier@linaro.org
> Cc: devicetree@vger.kernel.org; linux-remoteproc@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Michal Sime=
k
> <michals@xilinx.com>
> Subject: [PATCH v25 0/5] Provide basic driver to control Arm R5 co-proces=
sor
> found on Xilinx ZynqMP
>=20
> R5 is included in Xilinx Zynq UltraScale MPSoC so by adding this
> remotproc driver, we can boot the R5 sub-system in two different
> configurations -
> 	* Split
> 	* Lockstep
>=20
> The Xilinx R5 Remoteproc Driver boots the R5's via calls to the Xilinx
> Platform Management Unit that handles the R5 configuration, memory access
> and R5 lifecycle management. The interface to this manager is done in thi=
s
> driver via zynqmp_pm_* function calls.
>=20
> v25:
> - reword error message for rpu configuration
> - change char name[15] to 16 chars to have null terminated string
>   in parse_mem_regions()
> - reword comments in tcm_mem_alloc
> - grammar in device tree bindings
> - call xilinx platform cleanup in parse_tcm_banks() case of failure
> - check value of mbox_send_message in all calls within this driver
> - update include/linux/firmware/xlnx-zynqmp.h style to match for enum
>   pm_node_id
> - indentation in zynqmp_r5_remoteproc driver
> - update style of constructing carveouts to match convention in ST
>   remoteproc drivers. No longer iterate through memory-region property
>   using of_count_phandle_with_args. Instead use of_phandle_iterator
> - use rproc_of_resm_mem_entry_init for vdev0buffer carveout as per
> feedback
> - rework loop in zynqmp_r5_pm_request_sram as per feedback
> - fix comment and linebreak in tcm_mem_alloc description
> - add comments and remove extraneous devm_ioremap_wc call in
> tcm_mem_alloc
> - in parse_tcm_banks remove check for bank not being available
> - rework order of locals and remove else in zynqmp_r5_rproc_kick
> - document and update logic for zynqmp_r5_parse_fw
> - add dev_dbg output in event_notified_idr_cb if
>   rproc_vq_interrupt(rproc, id) =3D=3D IRQ_NONE
> - add comment for handle_event_notified mbox_send_message function call
> - add comment for zynqmp_r5_mb_rx_cb
> - update zynqmp_r5_setup_mbox to match convention of mbox setup in ST
>   remoteproc drivers
> - change return in zynqmp_r5_setup_mbox to use PTR_ERR
> - add zynqmp_r5_cleanup_mbox
> - in zynqmp_r5_probe, reteurn zynqmp_r5_rproc instead of taking in as arg=
.
> - in zynqmp_r5_probe use return of PTR_ERR and use
> zynqmp_r5_cleanup_mbox
> - in zynqmp_r5_remoteproc_probe update use return value of
> zynqmp_r5_probe as
>   either zynqmp_r5_rproc* or PTR_ERR
> - update loop that cleans up cluster and mboxes in
> zynqmp_r5_remoteproc_probe
> - update loop that cleans up cluster and mboxes in
> zynqmp_r5_remoteproc_remove
>=20
> Previous version:
> https://patchwork.kernel.org/project/linux-remoteproc/list/?series=3D3933=
87
>=20
>=20
> Ben Levinsky (5):
>   firmware: xilinx: Add ZynqMP firmware ioctl enums for RPU
>     configuration.
>   firmware: xilinx: Add shutdown/wakeup APIs
>   firmware: xilinx: Add RPU configuration APIs
>   dt-bindings: remoteproc: Add documentation for ZynqMP R5 rproc
>     bindings
>   remoteproc: Add initial zynqmp R5 remoteproc driver
>=20
>  .../xilinx,zynqmp-r5-remoteproc.yaml          | 223 +++++
>  drivers/firmware/xilinx/zynqmp.c              |  96 ++
>  drivers/remoteproc/Kconfig                    |   8 +
>  drivers/remoteproc/Makefile                   |   1 +
>  drivers/remoteproc/zynqmp_r5_remoteproc.c     | 897 ++++++++++++++++++
>  include/linux/firmware/xlnx-zynqmp.h          |  66 +-
>  6 files changed, 1290 insertions(+), 1 deletion(-)
>  create mode 100644
> Documentation/devicetree/bindings/remoteproc/xilinx,zynqmp-r5-
> remoteproc.yaml
>  create mode 100644 drivers/remoteproc/zynqmp_r5_remoteproc.c
>=20
> --
> 2.17.1

