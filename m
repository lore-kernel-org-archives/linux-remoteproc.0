Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE09C64ED8
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Feb 2023 17:28:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233007AbjBNR2Y (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Feb 2023 12:28:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232975AbjBNR2W (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Feb 2023 12:28:22 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C562E17169;
        Tue, 14 Feb 2023 09:28:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 524ED617CB;
        Tue, 14 Feb 2023 17:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1E5C433D2;
        Tue, 14 Feb 2023 17:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676395697;
        bh=SV5GPLdF2rbzXc1ENoD6s2AT0EjO+OT1lLh4HeHOFsI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h5CvuZ+YyBmLKfsJ/DX7wM80lwKyXCpsVZbVkogUTo3ZjrviKsAW6a4uXUfNgjWaQ
         HjEbpRkaZMYBQT0SqT+NoD0wOOvDdgUzEh5V8OpJEwSBMIKqt3LEfmv6N1uSdgmW0B
         UPydKxYEK6ItAmslM0CcUyiEFEM7ZqYSQzHHNrp1BcLxBrFQCwSgJsT3aEku5HK6Oz
         xNdAKi921zQpjWdy//92nOpfmTU0Y3NE4m18npzLwk5UmPGJbwC3sOkeDy3Hsfhbhf
         v+Isi3wppgbZxi1pAREPNF4EVfSMd0cCg8/8ag6h2pZistOkIJInQ7rqOQiS9gCe7Q
         Ef3qL8Nsa+qSQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: enable sm8550 adsp & cdsp autoboot
Date:   Tue, 14 Feb 2023 09:30:16 -0800
Message-Id: <167639581473.996065.16243877637995875517.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206-topic-sm8550-upstream-fix-remoteproc-autoboot-v1-1-11445a0c27c6@linaro.org>
References: <20230206-topic-sm8550-upstream-fix-remoteproc-autoboot-v1-1-11445a0c27c6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 06 Feb 2023 14:53:31 +0100, Neil Armstrong wrote:
> Set the SM8550 adsp & cdsp auto_boot to true to match the behavior
> of the previous platforms.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_pas: enable sm8550 adsp & cdsp autoboot
      commit: a8086bd9723ac8f1f795ab64f1de7dd0b9be889a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
