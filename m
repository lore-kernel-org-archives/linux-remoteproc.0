Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v3 0/3] Introduce Protection Domain Restart (PDR) Helpers
Date: Mon, 30 Dec 2019 10:30:05 +0530
Message-Id: <20191230050008.8143-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org, robh+dt@kernel.org, tsoni@codeaurora.org
Cc: agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Qualcomm SoCs (starting with MSM8998) allow for multiple protection
domains (PDs) to run on the same Q6 sub-system. This allows for
services like AVS AUDIO to have their own separate address space and
crash/recover without disrupting the other PDs running on the same Q6
ADSP. This patch series introduces pdr helper library and adds PD
tracking functionality for "avs/audio" allowing apr services to register
themselves asynchronously once the dependent PDs are up.

V3:
 * patches 2 and 3 remain unchanged.
 * reset servloc_addr/servreg_addr.
 * fixup the helpers to handle servloc_work/servreg_work asynchronously.
 * fixup useage of list_lock across traversals, insertions and deletions.
 * fixup the helpers to use a single lookup list.
 * skip waiting for response on ind_ack send.
 * introduce pdr_servreg_link_create to re-use existing qmi connection to
   servreg instances. This helps tracking PDs running on the same remote
   processor.
 * have a per node curr_state in pdr_list_node to preserve all state
   updates during indack_cb.
 * introduce additional servreg_service_state values to help the client
   distinguish between a fatal and non-fatal pdr_lookup errors.
 * re-order pdr_handle_release sequence.
 * fixup "!ind_msg->service_path returns true always" warning.
 * fixup comments.

V2:
 * fixup pd_status callback to return void.
 * return 0 from pdr_get_domain_list on success.
 * introduce status_lock to linearize the pd_status reported back
   to the clients.
 * use the correct service name length across various string operations
   performed.
 * service locator will now schedule the pending lookups registered
   when it comes up.
 * other minor cleanups that Bjorn suggested.
 * use pr_warn to indicate that the wait for service locator timed
   out.
 * add Bjorn/Srini's "Reviewed-by" for the dt-bindings.

To Do:
 * Add support for pd tracking in fastrpc driver.

Sibi Sankar (3):
  soc: qcom: Introduce Protection Domain Restart helpers
  dt-bindings: soc: qcom: apr: Add protection domain bindings
  soc: qcom: apr: Add avs/audio tracking functionality

 .../devicetree/bindings/soc/qcom/qcom,apr.txt |  59 ++
 drivers/soc/qcom/Kconfig                      |   6 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/apr.c                        | 100 ++-
 drivers/soc/qcom/pdr_interface.c              | 709 ++++++++++++++++++
 drivers/soc/qcom/pdr_internal.h               | 375 +++++++++
 include/linux/soc/qcom/apr.h                  |   1 +
 include/linux/soc/qcom/pdr.h                  | 109 +++
 include/linux/soc/qcom/qmi.h                  |   1 +
 9 files changed, 1350 insertions(+), 11 deletions(-)
 create mode 100644 drivers/soc/qcom/pdr_interface.c
 create mode 100644 drivers/soc/qcom/pdr_internal.h
 create mode 100644 include/linux/soc/qcom/pdr.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
