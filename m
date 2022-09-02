Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E7D3C6FA82
	for <linux-remoteproc@archiver.kernel.org>; Fri,  2 Sep 2022 19:32:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbiIBTcp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 2 Sep 2022 15:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbiIBTcn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 2 Sep 2022 15:32:43 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE309106D88
        for <linux-remoteproc@vger.kernel.org>; Fri,  2 Sep 2022 12:32:42 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id x23so2796182pll.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 02 Sep 2022 12:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=V7R5ZOzee+xNnoboOxnimiekBXFaPMkt2x1jVom81wY=;
        b=UdNWXvmdkjm7IwgxaKgRblvRTaFdSOEqqdCPPbdnMeyKoxR9Tuw+ILuoXPizs5yUAF
         ojFKUICsre1zYdyHYkwN7Rp4zW8yUjKjJETfzHxV4vzMBHlhnEHcyr8wcAdMhSPgXJ0+
         SuoVs/NActrqAuzWw5oECGdJcfYrw179QgV9MVTX5RtN+F6oXywXQ0DWuQZXqzpDziN8
         JGHEcJSUAe2se2ZSc+l00bQXKhhwbvOnKsRMxWXUMwg4+z+8qeYTowuFoIpO8cygjt5X
         efxVatVh5UE1qSTzr2BhTm/NVQ7DxURW9Cj14x8ELC5XoWLri8QFwrMysyOnxdg92P3/
         B90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=V7R5ZOzee+xNnoboOxnimiekBXFaPMkt2x1jVom81wY=;
        b=hT3Bj0Tmv7L7k7ZY3qaoA5vdAG+uZfKTxxf+MPG6SATlU3DOYe9zk2G5jfT/rw2d+l
         oobx3dLIoenwcIzEo8cZNHCM2H3/QHNGoCwPqMwdpLboZKaVf9xb+YUWuVUhoQn/dzpM
         k/bH3LgryHY7tBbkQbyqCe3fxx2RtjuPyyGho5FJsRQ9i9vdvEpCHYVi7aWl8+N45MQK
         MHIEwPMoB9KmHXQ5ft+VLErzxJIziyWVqSVq6A+ubwE6Rm4hkkk+FLpfAQU85rhls5fG
         2SBGhZ991ybv09zf9/d6hNb8uRxXHr69Tl8lHpUzjhvmd9WxE4okN9WuXQoARFgPj76X
         rdpw==
X-Gm-Message-State: ACgBeo3LECeMdm7ycvaMzUwV0bF+0fy0MC4V2W0z2RAgxYRv/FR8A17X
        sLZ5sdipQrrDziAk2DccvuKLlg==
X-Google-Smtp-Source: AA6agR4QxbcWINqkTPIasNYKWWoCa3b2SRA3y4oXoPH/GOirAH6T5k77cT3Eyc8HgjYM7ACdUOwEMQ==
X-Received: by 2002:a17:90a:b108:b0:1fd:fac2:5a3f with SMTP id z8-20020a17090ab10800b001fdfac25a3fmr6484892pjq.55.1662147162321;
        Fri, 02 Sep 2022 12:32:42 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id k1-20020aa79981000000b00534bb955b36sm2237225pfh.29.2022.09.02.12.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 12:32:41 -0700 (PDT)
Date:   Fri, 2 Sep 2022 13:32:39 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     cgel.zte@gmail.com
Cc:     bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, ye.xingchen@zte.com.cn,
        --cc=zealci@zte.com.cn
Subject: Re: [PATCH linux-next] rpmsg: char: Remove the unneeded result
 variable
Message-ID: <20220902193239.GA1787913@p14s>
References: <20220831164632.GA217472@p14s>
 <20220901053231.312211-1-ye.xingchen@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220901053231.312211-1-ye.xingchen@zte.com.cn>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, Sep 01, 2022 at 05:32:31AM +0000, cgel.zte@gmail.com wrote:
> Thank you for your reply.
> 
> In fact,‘cgel.zte@gmail.com’ is our company's public mail address, and ‘ye.xingchen@zte.com.cn’is my personal mail address in the company.‘ZTE’ is the name of company, and ‘CGEL’the name of our project team in company.
> 
> For some reason, the patchs needs to be reviewed by the company before it is sent out, and we have to use public mailboxes to send mails, because personal mailboxes are not allowed to send mails.
> 
> Because it is the patch I submitted, the mail about the patch will be sent to my personal mailbox through the public mailbox.

Thank you for the clarification - I have applied your patch.

> 
>  
> Thanks,
> YE XINGCHEN
