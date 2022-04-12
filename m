Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAF6C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue, 12 Apr 2022 10:46:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359473AbiDLKtH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Apr 2022 06:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357537AbiDLKqG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Apr 2022 06:46:06 -0400
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03BC140EA;
        Tue, 12 Apr 2022 02:46:53 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23C9kfGa005679;
        Tue, 12 Apr 2022 04:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1649756801;
        bh=i/HJ+zZsyxwaz/TSJISxZa6OEBfTC1Es+lc7wWelgDc=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=ss0eCm4pMgZQA5BoIssYIyWyywYLl3H+3LtUAWFSNTFleVzoAZpnV2LOtHN02Mc4W
         Nqvp5wPdgasN9qX62BGJqIJBO051puzZ9ZnmqbaCwDzt/uMJ2wWodJIo5m3g4jU6Lo
         6K8Zhm6pxk8jHbqRk+1pkKdqUzE+gclzP5KFUOOk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23C9kfkW011525
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 12 Apr 2022 04:46:41 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 12
 Apr 2022 04:46:41 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 12 Apr 2022 04:46:41 -0500
Received: from [10.24.69.24] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23C9kavA100290;
        Tue, 12 Apr 2022 04:46:36 -0500
Message-ID: <080bf31d-a452-af0b-ca41-a6b3d951e18f@ti.com>
Date:   Tue, 12 Apr 2022 15:16:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC 13/13] net: ti: icssg-prueth: Add ICSSG ethernet driver
Content-Language: en-US
To:     Andrew Lunn <andrew@lunn.ch>
CC:     <linux-kernel@vger.kernel.org>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nm@ti.com>, <ssantosh@kernel.org>, <s-anna@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <davem@davemloft.net>,
        <kuba@kernel.org>, <netdev@vger.kernel.org>, <vigneshr@ti.com>,
        <kishon@ti.com>, roger Quadros <rogerq@kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
References: <20220406094358.7895-1-p-mohan@ti.com>
 <20220406094358.7895-14-p-mohan@ti.com> <Yk3fHzDsl1iNl9ah@lunn.ch>
From:   Puranjay Mohan <p-mohan@ti.com>
In-Reply-To: <Yk3fHzDsl1iNl9ah@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

+Roger, Grygorii

On 07/04/22 00:12, Andrew Lunn wrote:
>> +config TI_ICSSG_PRUETH
>> +	tristate "TI Gigabit PRU Ethernet driver"
>> +	select TI_DAVINCI_MDIO
>> +
> 
> I don't see a dependency on TI_DAVINCI_MDIO in the code. All you need
> is an MDIO bus so that your phy-handle has somewhere to point. But that
> could be a GPIO bit banger.
> 
> What i do think is missing here is a dependency on PHYLIB.
> 
> If possible, it would be good to also have it compile when
> COMPILE_TEST is set.
> 
>      Andrew
