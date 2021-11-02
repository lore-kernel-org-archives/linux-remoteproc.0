Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58EFDC433EF
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 14:04:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2741460F90
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 14:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbhKBOHN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 2 Nov 2021 10:07:13 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:37164 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230124AbhKBOHN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Nov 2021 10:07:13 -0400
X-UUID: 6670d21069c341a5b8172b5157fe5cef-20211102
X-UUID: 6670d21069c341a5b8172b5157fe5cef-20211102
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
        (envelope-from <mark-pk.tsai@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 672707749; Tue, 02 Nov 2021 22:04:34 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Nov 2021 22:04:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 2 Nov 2021 22:04:33 +0800
From:   Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To:     <linux@armlinux.org.uk>
CC:     <bjorn.andersson@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <mark-pk.tsai@mediatek.com>,
        <mathieu.poirier@linaro.org>, <matthias.bgg@gmail.com>,
        <ohad@wizery.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH] remoteproc: use %d format string to print return error code
Date:   Tue, 2 Nov 2021 22:04:33 +0800
Message-ID: <20211102140433.28170-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YYErBcJlkTi0sJ/N@shell.armlinux.org.uk>
References: <YYErBcJlkTi0sJ/N@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> On Tue, Nov 02, 2021 at 08:08:05PM +0800, Mark-PK Tsai wrote:
> > Use %d format string to print return error code which
> > make the error message easier to understand.
> 
> Even better, if you use %pe after converting "ret" to a pointer via
> ERR_PTR(ret), when the kernel is appropriately configured, the kernel
> will give a textual version of the error code, which is even easier!

Thanks for the suggestion!
I will use it in v2.
