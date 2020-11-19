Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D00C56201
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 21:06:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A13F221EB
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 Nov 2020 21:06:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="JOLwDCBK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgKSVFy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 19 Nov 2020 16:05:54 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:51536 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725907AbgKSVFy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 19 Nov 2020 16:05:54 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605819953; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=p02axMjNocUH+jqzcrSgerd2G87SR9mTMt14pK8m/ok=; b=JOLwDCBKv/RspP5Xxqs8LxeKo8vOzKpmerWnxjwd/9pArvLEnvJuvV/d3tSM4fip2OA0mOk5
 w0d+SCg1axDiAnxL1whs30dFEyLmePmC/XbWwY4xOowDxprsZ3EZfytWkKgyLRtRwmRD3Kds
 FqKiuGVK4jvFlBWdxkPL4ogDbRM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5fb6de319e87e16352b13eef (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Nov 2020 21:05:53
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 62AA2C43463; Thu, 19 Nov 2020 21:05:52 +0000 (UTC)
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ED978C433C6;
        Thu, 19 Nov 2020 21:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ED978C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v8 0/4] Introduce mini-dump support for remoteproc
Date:   Thu, 19 Nov 2020 13:05:31 -0800
Message-Id: <1605819935-10726-1-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Sometimes firmware sizes can be in tens of MB's and reading all the memory
during coredump can consume lot of time and memory.

Introducing support for mini-dumps. Mini-dump contains smallest amount of
useful information, that could help to debug subsystem crashes.

During bootup memory is allocated in SMEM (Shared memory) in the form of a
table that contains the physical addresses and sizes of the regions that
are supposed to be collected during coredump. This memory is shared amongst
all processors in a Qualcomm platform, so all remoteprocs fill in their
entry in the global table once they are out of reset.

This patch series adds support for parsing the global minidump table and
uses the current coredump frameork to expose this memory to userspace
during remoteproc's recovery.

This patch series also integrates the patch:
https://patchwork.kernel.org/patch/11695541/ sent by Siddharth.

Changelog:
v7 -> v8:
- Addressed all comments from Bjorn:
    * Renamed set_section_name to elf_strtbl_add.
    * Renamed rproc_minidump to rproc_coredump_using_sections.
    * Removed qcom_minidump header and moved structures to qcom_common source files.
    * Moved minidump specific functions to qcom_common source files.
    * Other minor fixes.

v6 -> v7:
- The STR_TAB size is calculated dynamically now instead of a predefined size.
- Added comments to indicate details about the reserved null section header. More
  details can be found at https://refspecs.linuxfoundation.org/elf/elf.pdf.

v5 -> v6:
- Removed priv_cleanup operation from rproc_ops. The dump_segments list is
  updated and cleaned up each time minidump is invoked.
- Split patch #2 into 2 parts - one that adds the rproc_minidump function, and
  the other that uses the new function in the qcom_q6v5_pas driver.
- Updated structs in qcom_minidump to explicitly indicate the endianness of the
  data stored in SMEM, also updated member names.
- Read the global table of contents in SMEM each time adsp_minidump is invoked.

v4 -> v5:
- Fixed adsp_add_minidump_segments to read IO memory using appropriate functions.

v3 -> v4:
- Made adsp_priv_cleanup a static function.

v2 -> v3:
- Refactored code to remove dependency on Qualcomm configs.
- Renamed do_rproc_minidump to rproc_minidump and marked as exported
  symbol.

v1 -> v2:
- 3 kernel test robot warnings have been resolved.
- Introduced priv_cleanup op in order to making the cleaning of
  private elements used by the remoteproc more readable.
- Removed rproc_cleanup_priv as it is no longer needed.
- Switched to if/else format for rproc_alloc in order to keep 
  the static const decalaration of adsp_minidump_ops.

Siddharth Gupta (4):
  remoteproc: core: Add ops to enable custom coredump functionality
  remoteproc: coredump: Add minidump functionality
  remoteproc: qcom: Add capability to collect minidumps
  remoteproc: qcom: Add minidump id for sm8150 modem

 drivers/remoteproc/qcom_common.c            | 147 ++++++++++++++++++++++++++++
 drivers/remoteproc/qcom_common.h            |   2 +
 drivers/remoteproc/qcom_q6v5_pas.c          |  28 +++++-
 drivers/remoteproc/remoteproc_core.c        |   6 +-
 drivers/remoteproc/remoteproc_coredump.c    | 140 ++++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_elf_helpers.h |  26 +++++
 include/linux/remoteproc.h                  |   3 +
 7 files changed, 349 insertions(+), 3 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

