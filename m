Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157EFC433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 12:12:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F344960FC2
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 12:11:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhKBMOe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 2 Nov 2021 08:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbhKBMOb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Nov 2021 08:14:31 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45062C061714;
        Tue,  2 Nov 2021 05:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=o6FGnU4FYOY3wyYVmDluYr+k4/2zK3R/YdK8+ZD+B24=; b=xcBw0Q2V9DCSvPYJKTfqqnt58Y
        Xxi0DhL4Go3hSmgmSTgUKCBZtG/cqy3CiK/5jx2H3aDtAlltAzP1H5p2UTKPiXQDJA+o538iXovEP
        /FxuEUidPzD7z9R3XJnumXLmvIerc1DIkMtH/sg/cHQyE8aEEDOW590g3N9MQl/Qkgc2a6X4Jl9RF
        QZtmo1k87gLy1FpzUvbuuQKGoLtMIrLa0HWfEoYI+W8hriexTPLAN12u4vF8Wln7tCirizlfSqK6a
        Xag91bRze7t2HHj9PJCLJ1/HRdurlHwC1AuGBu7F0Q7hZBEuqDo6yrJO531TXnOEJgRwnQJmHxkfE
        3OeQn7uA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55436)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1mhsds-0003mX-PL; Tue, 02 Nov 2021 12:11:52 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1mhsdp-0005Oz-CD; Tue, 02 Nov 2021 12:11:49 +0000
Date:   Tue, 2 Nov 2021 12:11:49 +0000
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, matthias.bgg@gmail.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, yj.chiang@mediatek.com
Subject: Re: [PATCH] remoteproc: use %d format string to print return error
 code
Message-ID: <YYErBcJlkTi0sJ/N@shell.armlinux.org.uk>
References: <20211102120805.27137-1-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102120805.27137-1-mark-pk.tsai@mediatek.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Nov 02, 2021 at 08:08:05PM +0800, Mark-PK Tsai wrote:
> Use %d format string to print return error code which
> make the error message easier to understand.

Even better, if you use %pe after converting "ret" to a pointer via
ERR_PTR(ret), when the kernel is appropriately configured, the kernel
will give a textual version of the error code, which is even easier!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
