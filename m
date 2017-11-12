Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:34984 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751089AbdKLRRf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 12 Nov 2017 12:17:35 -0500
From: Randy Dunlap <rdunlap@infradead.org>
Subject: rpmsg: qcom_glink_native: no module license, taints kernel
Message-ID: <93ce6e23-3613-516e-2029-d020166f1113@infradead.org>
Date: Sun, 12 Nov 2017 09:17:30 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-remoteproc-owner@vger.kernel.org
To: LKML <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
List-ID: <linux-remoteproc@vger.kernel.org>

[44098.635339] qcom_glink_native: module license 'unspecified' taints kernel.
[44098.635343] Disabling lock debugging due to kernel taint
[44098.635482] qcom_glink_native: Unknown symbol mbox_send_message (err 0)
[44098.635512] qcom_glink_native: Unknown symbol devm_kmalloc (err 0)
[44098.635533] qcom_glink_native: Unknown symbol mbox_free_channel (err 0)
[44098.635557] qcom_glink_native: Unknown symbol device_unregister (err 0)
[44098.635580] qcom_glink_native: Unknown symbol device_for_each_child (err 0)

-- 
~Randy
