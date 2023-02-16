Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA01EC636CC
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Feb 2023 08:39:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjBPIjn (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 16 Feb 2023 03:39:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjBPIjm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Feb 2023 03:39:42 -0500
Received: from stravinsky.debian.org (stravinsky.debian.org [IPv6:2001:41b8:202:deb::311:108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1D241B546;
        Thu, 16 Feb 2023 00:39:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
        s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
        :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
        Reply-To:Content-ID:Content-Description;
        bh=rJMdqczWXRiQsSsJ4oTAxn1WK+A3eOMv7NUTintonZc=; b=rdfME8jOxuKi7e9fjhXk6y/oPJ
        /xTjwNpDvvThCVGr2McqvPVE0m2Yk6ZnaJ3GzkK1lwZYJ5U4ee4r8PMuZ8TklnUK7sIMqtx4XyBMz
        Go/vrQmN8Pv0JF+CekFV3eO6aOm7TYRkIOfyXnQgDLhXzxdYUWyHA8P7d1i+7IPwrxTz3Fkz8akn4
        HUO0oTFKD2/AV2ZKTOItuGvnrtMOJ7Cnsu5Rh0Fn1BXQ9TjQjtDb/9nAqXmRblkupkOVBMvV3kMkv
        9ixpcUUtDCBC3fQmkiENSllZcgylnl7o5wUS0TY7rmNlsjt5bBBA1M2hSAaPeMv7piQLYzp3U9wjk
        7gCLUVlA==;
Received: from authenticated user
        by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
        (Exim 4.94.2)
        (envelope-from <bage@debian.org>)
        id 1pSZnR-003ADy-MP; Thu, 16 Feb 2023 08:39:18 +0000
Message-ID: <2720557c-15a2-a077-8608-133f58058e4b@debian.org>
Date:   Thu, 16 Feb 2023 09:39:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] dt-bindings: hwlock: sun6i: Add missing #hwlock-cells
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Wilken Gottwalt <wilken.gottwalt@posteo.net>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20230213231931.6546-1-bage@debian.org>
 <20230213231931.6546-2-bage@debian.org>
 <CAL_JsqJ6mvMZ2qWcSwKhuPRk29V2Yrx0_CCywmZd7=y-kzTRNw@mail.gmail.com>
Content-Language: de-DE-frami
From:   Bastian Germann <bage@debian.org>
In-Reply-To: <CAL_JsqJ6mvMZ2qWcSwKhuPRk29V2Yrx0_CCywmZd7=y-kzTRNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Debian-User: bage
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Am 15.02.23 um 15:07 schrieb Rob Herring:
> Now failing in linux-next as reported. Please send a fix.

That is in v2 2/5.
