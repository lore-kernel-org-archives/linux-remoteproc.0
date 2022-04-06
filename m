Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4A5C4332F
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Apr 2022 20:23:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231262AbiDFUZL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Apr 2022 16:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236453AbiDFUYG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Apr 2022 16:24:06 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49FCD23FF30;
        Wed,  6 Apr 2022 11:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=PYVHqwQP9zUY5QYwTSBSr5XJSO70ZDvgRQzi+eB230o=; b=Uf7ow8gdHmT8OrN4RZLA/xb9C9
        ykoP89LtoLUuyFpyNKNZur3AX6xAIEjEjlKnSI0NGaFcdUjD0vLnf3MvpM3PwrrUOXZdya4sTI60K
        1VRfjYQD7+A+zhXiXBOdpgCohsP+Wpx1JA+FKAxe1NNz5fm6Q4TsnJo0/ZFUNju2V3FM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1ncAc3-00EVPB-8c; Wed, 06 Apr 2022 20:42:39 +0200
Date:   Wed, 6 Apr 2022 20:42:39 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Puranjay Mohan <p-mohan@ti.com>
Cc:     linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        nm@ti.com, ssantosh@kernel.org, s-anna@ti.com,
        linux-arm-kernel@lists.infradead.org, davem@davemloft.net,
        kuba@kernel.org, netdev@vger.kernel.org, vigneshr@ti.com,
        kishon@ti.com
Subject: Re: [RFC 13/13] net: ti: icssg-prueth: Add ICSSG ethernet driver
Message-ID: <Yk3fHzDsl1iNl9ah@lunn.ch>
References: <20220406094358.7895-1-p-mohan@ti.com>
 <20220406094358.7895-14-p-mohan@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406094358.7895-14-p-mohan@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

> +config TI_ICSSG_PRUETH
> +	tristate "TI Gigabit PRU Ethernet driver"
> +	select TI_DAVINCI_MDIO
> +

I don't see a dependency on TI_DAVINCI_MDIO in the code. All you need
is an MDIO bus so that your phy-handle has somewhere to point. But that
could be a GPIO bit banger.

What i do think is missing here is a dependency on PHYLIB.

If possible, it would be good to also have it compile when
COMPILE_TEST is set.

     Andrew
