Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784E9C04E69
	for <linux-remoteproc@archiver.kernel.org>; Sat, 15 Jul 2023 22:10:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjGOWKW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 15 Jul 2023 18:10:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229984AbjGOWKT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 15 Jul 2023 18:10:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C942726;
        Sat, 15 Jul 2023 15:10:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8FD4360C4C;
        Sat, 15 Jul 2023 22:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB64C433CB;
        Sat, 15 Jul 2023 22:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689459018;
        bh=KijkQQETXcRlA1pEYF4FrCbVGE2AL8/iGtYNvFtqUg4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i+EhICcia9seqDJEixToFZejWW+u/MrHyk7N8y/EKdO3KqyStO/ubqO8nLCtb1KnD
         uTWrbZ9dUPaTWXqkc8lsWp7S8aZ/Hql5/hBqdBmkNKUQ5EkrKjCBmFMuAIzXh+DXtG
         4D9zagQmybZWJZ4CueU24whv7vBD+eEhDzhYzd33kT96O9Rj1OHd+dKEu/mxJOSJic
         qv5comz3ILr4QFwrGQYg41Z4Z6T1fwDaKGJVQ/QOPV56CKpXvltK9znEee7PHkUz+o
         +vhK0QsSKrO5/GubmboOnYOKZXpNVVxQjXM3CH/0CszBTp/G3rSGmByWR9dkC0MhIk
         qEAtVpSFJZzsA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
Cc:     Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Guru Das Srinagesh <quic_gurus@quicinc.com>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5 0/2] Fallback to full coredump
Date:   Sat, 15 Jul 2023 15:13:33 -0700
Message-ID: <168945921466.1805013.3451594726021488314.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230224211707.30916-1-quic_gokukris@quicinc.com>
References: <20230224211707.30916-1-quic_gokukris@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On Fri, 24 Feb 2023 13:17:05 -0800, Gokul krishna Krishnakumar wrote:
> Add support for full coredump as a fallback mechanism in
> absence of minidump support.
> 
> Siddharth Gupta (2):
>   remoteproc: core: Export the rproc coredump APIs
>   remoteproc: qcom: Add full coredump fallback mechanism
> 
> [...]

Applied, thanks!

[1/2] remoteproc: core: Export the rproc coredump APIs
      commit: f247f08da0ce822de0d6b2feec811dd6d4d599ce
[2/2] remoteproc: qcom: Add full coredump fallback mechanism
      commit: 5c43ed8ad20b29c89991c03d4c84afb9c53608a3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
