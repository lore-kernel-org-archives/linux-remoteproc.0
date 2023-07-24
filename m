Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 597B2C001B0
	for <linux-remoteproc@archiver.kernel.org>; Mon, 24 Jul 2023 16:16:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjGXQQj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 24 Jul 2023 12:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjGXQQg (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 24 Jul 2023 12:16:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78F1610C3;
        Mon, 24 Jul 2023 09:16:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 08AE361254;
        Mon, 24 Jul 2023 16:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 637C7C433C7;
        Mon, 24 Jul 2023 16:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690215394;
        bh=x3A3zOJ4CdXcBTt2FepwCLKHLI0SCa4VSWer2FWHZXE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZJkto0NSHXZgkOYlitfIZeqOK/5arLC5ZiHbR6kzCNpCdJ7Tdsk+/TOCSJ3t3gvdD
         1m5s8zDy2z4mX8FbyiUn6dDmzHZmXvjr6pJgzV9kMcKBdNfkoKJ73jDLMLGULz5sLj
         RufRJTI4c14pr+SCvtFFictWl1XoyH3VFO5J+XMFVqodgyFbWEgp2E63sNxlAwjqHF
         2CF7TJSblLV+ecHj9kuJDcncT99rklPpu2JHCp+VUGyW33IrwNLbyH7BHVjHKjPSPy
         WgMWLMT7XMpx0SiiOCVtYpTXotler6VX14iZ6kenv6k40u8aOePs2wqxlrWEKdxoIF
         kiz2M9kU1TfdQ==
Received: (nullmailer pid 3712940 invoked by uid 1000);
        Mon, 24 Jul 2023 16:16:32 -0000
Date:   Mon, 24 Jul 2023 10:16:32 -0600
From:   Rob Herring <robh@kernel.org>
To:     Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc:     andersson@kernel.org, mathieu.poirier@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        michal.simek@amd.com, ben.levinsky@amd.com, tanmay.shah@amd.com,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@amd.com
Subject: Re: [PATCH v3] dt-bindings: remoteproc: add Tightly Coupled Memory
 (TCM) bindings
Message-ID: <20230724161632.GA3686365-robh@kernel.org>
References: <1689964908-22371-1-git-send-email-radhey.shyam.pandey@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1689964908-22371-1-git-send-email-radhey.shyam.pandey@amd.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, Jul 22, 2023 at 12:11:48AM +0530, Radhey Shyam Pandey wrote:
> Introduce bindings for TCM memory address space on AMD-xilinx Zynq
> UltraScale+ platform. It will help in defining TCM in device-tree
> and make it's access platform agnostic and data-driven.

From the subject, it sounds like this is a binding for all of remoteproc 
for TCMs.

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>
