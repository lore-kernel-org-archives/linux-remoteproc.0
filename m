Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:51919 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757716AbeD0Qwd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 27 Apr 2018 12:52:33 -0400
Date: Fri, 27 Apr 2018 18:52:28 +0200
From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] remoteproc/ste: remove abandoned include file
Message-ID: <20180427185228.669b5a09@endymion>
In-Reply-To: <20180427121638.10887-1-a.hajda@samsung.com>
References: <CGME20180427121651eucas1p2c4ebea8480acdc9016448eb58dd41e09@eucas1p2.samsung.com>
        <20180427121638.10887-1-a.hajda@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-remoteproc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri, 27 Apr 2018 14:16:38 +0200, Andrzej Hajda wrote:
> STE modem driver has been removed in 2016. This include has no
> users since then.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Jean Delvare <jdelvare@suse.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Ohad Ben-Cohen <ohad@wizery.com>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Suman Anna <s-anna@ti.com>
> ---
>  include/linux/ste_modem_shm.h | 56 -----------------------------------
>  1 file changed, 56 deletions(-)
>  delete mode 100644 include/linux/ste_modem_shm.h
> (...)

Good catch.

Acked-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
