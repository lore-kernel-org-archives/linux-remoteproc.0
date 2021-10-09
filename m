Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91683C433EF
	for <linux-remoteproc@archiver.kernel.org>; Sat,  9 Oct 2021 00:30:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7833E60F41
	for <linux-remoteproc@archiver.kernel.org>; Sat,  9 Oct 2021 00:30:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244027AbhJIAcj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 8 Oct 2021 20:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244016AbhJIAci (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 8 Oct 2021 20:32:38 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D3E8C061570
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Oct 2021 17:30:42 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id o83so8423566oif.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 08 Oct 2021 17:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d4DYf1R/vHJuoHLrKKzqNGOP7fMfeO41/+lqHM0JUWw=;
        b=NcqhTehlNQIE4ojmKb0Fz6gj86Xczjmlc1UIDNdMn+rcHkTEFAUAAmu0ZcuQJ6bUIe
         L8Rfc7D2EXu3xONNMZai+qF9VP11tf3aWnCzi3bNiEjIgZ0y48fZuvncxF+4pUjEfqmQ
         4Uk1ceSmojObtxFwpN1GKeoQyjTpQO/VCSdDntDKLFXbKg7AWrrPksNpdGuGdMd0/s21
         vxfCMWGB89iWWkZ9tPRhsgm/2KAPqezalI4216yADegGECUX/CdhJC4ElUXiWiNSvH/u
         nPpimbZz+u57FyWH2JrjWQkzRqLAWHzCkjHUCD3A77QM/ThOFr3AroLVPWikz5S93Jh8
         r0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d4DYf1R/vHJuoHLrKKzqNGOP7fMfeO41/+lqHM0JUWw=;
        b=vU8um0Z9/vxAFl8Z9u0DrsEq5/6rNndtf+VAgmMWVO5GUW+xGtZdsurne7PPWkoeXx
         HCTBPozlm4R99HXHTGbT9qlvHw02voc+SUgHmjxKNEH4EXSZWoDxor/BXTeZCmiteZpg
         GkxfkFXm77H+e/WJeN+CbiYxdDoBuJJ89oA9r3JP0c8JSKo5QTnWohTUSaPimpZ9HFXA
         8uVOrk7kJdWw1LBwFuz8dZ2LyMPGq1DRmkWnnQ/zHOyLJD5wGC+9vDgLpkvBlxbtROF+
         R/u6a0f5gpdui6E7jF2Ef3E5rMJb3CxV+YW38mW6lv3YYMdI5QtdX2hM9lzErHeGbqL0
         ux8Q==
X-Gm-Message-State: AOAM531PLP7/x1fDHq+89lg9IW7iPNYHOCJovY+lnUfeRWWevy/NIFnm
        vp5brid6CZKNWUdG0CELAljejw==
X-Google-Smtp-Source: ABdhPJwCo9rdFuljZRiPw/CyTmJn1aBYUt1MYPu85j5RF41FR5MrjWqTV1/C4eKIrAhu7oTEqozLuw==
X-Received: by 2002:aca:4007:: with SMTP id n7mr19529750oia.174.1633739441683;
        Fri, 08 Oct 2021 17:30:41 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id bh39sm267605oib.37.2021.10.08.17.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 17:30:41 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: (subset) [PATCH v5 1/4] rpmsg: char: Remove useless include
Date:   Fri,  8 Oct 2021 19:30:39 -0500
Message-Id: <163373942992.719534.404561077896393426.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712123752.10449-2-arnaud.pouliquen@foss.st.com>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com> <20210712123752.10449-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 12 Jul 2021 14:37:49 +0200, Arnaud Pouliquen wrote:
> No facility requests the include of rpmsg_internal.h header file.
> 
> 

Applied, thanks!

[1/4] rpmsg: char: Remove useless include
      commit: bc774a3887cb513be08e846726bc4402897b267a

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
