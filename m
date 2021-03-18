Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BA8C433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 06:08:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7119564F38
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 06:08:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhCRGIB (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 18 Mar 2021 02:08:01 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:57324 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229554AbhCRGHn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 18 Mar 2021 02:07:43 -0400
X-UUID: 9f5066baa31e4bdcb8c739a93d46dfbf-20210318
X-UUID: 9f5066baa31e4bdcb8c739a93d46dfbf-20210318
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <tinghan.shen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1867247100; Thu, 18 Mar 2021 14:07:41 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Mar 2021 14:07:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 18 Mar 2021 14:07:39 +0800
From:   Tinghan Shen <tinghan.shen@mediatek.com>
To:     <tzungbi@google.com>
CC:     <bjorn.andersson@linaro.org>, <linux-mediatek@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <matthias.bgg@gmail.com>,
        <ohad@wizery.com>, <tinghan.shen@mediatek.com>
Subject: Re: [PATCH v2] remoteproc/mediatek: set to DEVAPC domain 3 for MT8192 SCP
Date:   Thu, 18 Mar 2021 14:07:11 +0800
Message-ID: <20210318060711.31740-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210318012416.2816574-1-tzungbi@google.com>
References: <20210318012416.2816574-1-tzungbi@google.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> DEVAPC (device access permission control) is a MPU (memory protection
> unit) in MT8192.
>
> To restrict SCP accesses to a specific memory range, sets SCP to DEVAPC
> domain 3.  ATF (Arm trusted firmware) should setup memory range for the
> domain.
>
> Co-developed-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>

Hi,

we want to pull this patch back because we have another thought on how to reach our purpose.
thanks for your review.


Best regards,
TingHan
