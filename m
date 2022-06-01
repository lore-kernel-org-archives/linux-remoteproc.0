Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE65C433FE
	for <linux-remoteproc@archiver.kernel.org>; Wed,  1 Jun 2022 12:23:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351855AbiFAMXq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 1 Jun 2022 08:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350851AbiFAMXi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 1 Jun 2022 08:23:38 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F1793DA5C
        for <linux-remoteproc@vger.kernel.org>; Wed,  1 Jun 2022 05:23:34 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-f2cd424b9cso2457638fac.7
        for <linux-remoteproc@vger.kernel.org>; Wed, 01 Jun 2022 05:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ZeeMPsVq/F2kMhsR41ridh7qdYgsJ3WBnG/douuUrE=;
        b=LhBaRrG1fxI90fUlzneUqaVvc+fkDfCztkgs5q9MatvTuiEqmSvtYMbnAwd52xAe3I
         zRg+odQHSeRcWScWnjEEPEspwgMwqc57zsBgANK9qxcR/kC6iYapF9+qayx00vxc6wRv
         /Vs+8vxLR4eTTSluzg1B77+eIiHTEkyV1GgUGpqLmiizynYkKvNDJCCE+vFjmMqVTJEi
         lUue1Ca/NSvQBtbgV2UvUWvXgLYjD3MUFRwP9F0iEint4G1qw2QDf0xThtXF9qdZezFG
         uj5IRomooli3fEPqh78YSdz6Du36gS0MQaqPb/AG6dZ/m4p+E12JPifC7VfvwLg3+++o
         VVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ZeeMPsVq/F2kMhsR41ridh7qdYgsJ3WBnG/douuUrE=;
        b=OOnOuT1B6C1SiKzAxqLm4HCeIr8v8kpiOluR2Vtbr5xyH52vnu/aE6xfE8Ir8zK5c+
         GYOjSUNoZ1tOsEt8AKq+lgiSHvmIxzkyKZ9kfG/KgGLAXL0GJKleAkl8co4QK5UlKbUg
         Ah2WHPUfpC7rr/Ne6bZTs7fFR8D+L+DmvLYRXpQlxyD9F4hQmPdrUIq9iNzNYDtuRlSF
         qzZAhskUtYunOni640As/j2x7G33G0FGFUVSCNkvRiYFfytf/CNtK4F+x2e/mvVgyMot
         GcnTHsAn2LIdJiXEhU6U+Bh3O1+BhCId1MiEgg1+VGtNmCXyBZMzQEMkR3v6qUVmV+PV
         Fu0A==
X-Gm-Message-State: AOAM530UjOplNr08OvnVTQo53LN5mf0Ahn3kU1gt3XPpB0pzU6+6LD8s
        2VPw3j8PaTvqGATDgnpO0/o4V/KPPZOahg==
X-Google-Smtp-Source: ABdhPJwsy06DtmIXDK6TBLlB20wpUQ7qEftOU5W93iRILKFthhSU/xOYgS9iXHJc+MH8bri2mp3d9A==
X-Received: by 2002:a05:6870:891f:b0:f3:3811:3e30 with SMTP id i31-20020a056870891f00b000f338113e30mr8652915oao.269.1654086213813;
        Wed, 01 Jun 2022 05:23:33 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u2-20020a9d7202000000b00606387601a2sm685418otj.34.2022.06.01.05.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 05:23:33 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hangyu Hua <hbh25y@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [GIT PULL] rpmsg updates for v5.19
Date:   Wed,  1 Jun 2022 07:23:32 -0500
Message-Id: <20220601122332.536516-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

The following changes since commit ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e:

  Linux 5.18-rc2 (2022-04-10 14:21:36 -1000)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rpmsg-v5.19

for you to fetch changes up to 59d6f72f6f9c92fec8757d9e29527da828e9281f:

  rpmsg: qcom_smd: Fix returning 0 if irq_of_parse_and_map() fails (2022-04-28 14:32:15 -0500)

----------------------------------------------------------------
rpmsg updates for v5.19

This corrects the check for irq_of_parse_and_map() failures in the
Qualcomm SMD driver and fixes unregistration and a couple of double free
in the virtio rpmsg driver.

----------------------------------------------------------------
Arnaud Pouliquen (1):
      rpmsg: virtio: Fix the unregistration of the device rpmsg_ctrl

Hangyu Hua (2):
      rpmsg: virtio: Fix possible double free in rpmsg_probe()
      rpmsg: virtio: Fix possible double free in rpmsg_virtio_add_ctrl_dev()

Krzysztof Kozlowski (2):
      rpmsg: qcom_smd: Fix irq_of_parse_and_map() return value
      rpmsg: qcom_smd: Fix returning 0 if irq_of_parse_and_map() fails

 drivers/rpmsg/qcom_smd.c         | 4 ++--
 drivers/rpmsg/virtio_rpmsg_bus.c | 9 ++++-----
 2 files changed, 6 insertions(+), 7 deletions(-)
