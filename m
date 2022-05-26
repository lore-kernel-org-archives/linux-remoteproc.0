Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10275C433F5
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 May 2022 11:08:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244149AbiEZLIr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 26 May 2022 07:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243322AbiEZLIm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 May 2022 07:08:42 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27524CC178;
        Thu, 26 May 2022 04:08:42 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id EBFF41C0B8F; Thu, 26 May 2022 13:08:40 +0200 (CEST)
Date:   Thu, 26 May 2022 13:08:40 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Sibi Sankar <quic_sibis@quicinc.com>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [V4 0/2] Add modem debug features
Message-ID: <20220526110840.GD5138@localhost>
References: <1653396335-6295-1-git-send-email-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653396335-6295-1-git-send-email-quic_sibis@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi!

> The series adds support for the following modem debug features:
>  * Pass on MBA log info to imem
>  * Add panic handler for mss 

Can I get you to cc phone-devel mailing list?

Thanks,
							Pavel
							
