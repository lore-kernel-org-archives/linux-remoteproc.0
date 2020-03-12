Return-Path: <bounce+9957f9.be9e4a-bjorn.andersson=linaro.org@mg.codeaurora.org>
Sender: sibis=codeaurora.org@mg.codeaurora.org
From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v7 0/3] Introduce Protection Domain Restart (PDR) Helpers
Date: Thu, 12 Mar 2020 17:38:39 +0530
Message-Id: <20200312120842.21991-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org
Cc: agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, tsoni@codeaurora.org, vnkgutta@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-ID: <linux-remoteproc@vger.kernel.org>

Qualcomm SoCs (starting with MSM8998) allow for multiple protection
domains (PDs) to run on the same Q6 sub-system. This allows for
services like AVS AUDIO to have their own separate address space and
crash/recover without disrupting the other PDs running on the same Q6
ADSP. This patch series introduces pdr helper library and adds PD
tracking functionality for "avs/audio" allowing apr services to register
themselves asynchronously once the dependent PDs are up.

Userspace Links:
pd-mapper: https://github.com/andersson/pd-mapper/tree/json
diag-router: https://github.com/andersson/diag

Testing PDR with APR on SDM845 SoCs:
pd-mapper adspua.jsn &
diag-router &
send_data 75 37 03 144 00

V7:
 * Address Bjorn's comments on exiting early in pdr_locator_work 
 * SERVREG_LOCATOR_UNKNOWN_SERVICE is no longer propagated to
   clients allowing for lookups to recover on restarting pd-mapper
   with the proper database.
 * Non-recoverable SERVREG_LOCATOR_ERR errors are still communicated
   to the clients.

V6:
 * Fix minor compilation error introduced in V5
 * Pick up Rob's R-b

V5:
 * Pick up Bjorn's R-b
 * Service all pending lookup, notifier_register and
   notifier_remove requests.
 * Propagate error from pdr_register_listener
 * Remove notifier_init_complete flag workaround with
   the introduction of in-kernel ns.
 * Remove depends-on in Kconfig and add module license.

V4:
 * Drop handling db_rev_count error handling since it remains
   unused in upstream/downstream pd-mapper
 * Fixup dt bindings and examples. [Rob]
 * Dropping r-b from Bjorn/Srini for the dt bindings.
 * Privatize pdr_service/pdr_handle. [Srini/Bjorn]
 * Introduce notifier_init_complete to deal with cases where
   qmi_handle_net_reset is not enough to reset the port. This
   is to deal with cases where qrtr-ns starts after the adsp.
 * Introduce per addr per pds to deal with multiple service_paths
   per pdr_handle.
 * Uniformly rename servreg -> notifier, servloc -> locator. [Narendra]
 * Drop pdr_servreg_link_create tracking the service_path tracks
   all pds associated with it. [Bjorn]
 * Remove safe traversal for all cases where list is left
   unmodified. [Bjorn]
 * Address review comments in the apr driver and add comments. [Bjorn]
 * Other misc fixes. [Narendra/Bjorn]

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

Sibi Sankar (3):
  soc: qcom: Introduce Protection Domain Restart helpers
  dt-bindings: soc: qcom: apr: Add protection domain bindings
  soc: qcom: apr: Add avs/audio tracking functionality

 .../devicetree/bindings/soc/qcom/qcom,apr.txt |  50 ++
 drivers/soc/qcom/Kconfig                      |   5 +
 drivers/soc/qcom/Makefile                     |   1 +
 drivers/soc/qcom/apr.c                        | 123 ++-
 drivers/soc/qcom/pdr_interface.c              | 757 ++++++++++++++++++
 drivers/soc/qcom/pdr_internal.h               | 379 +++++++++
 include/linux/soc/qcom/apr.h                  |   1 +
 include/linux/soc/qcom/pdr.h                  |  29 +
 include/linux/soc/qcom/qmi.h                  |   1 +
 9 files changed, 1337 insertions(+), 9 deletions(-)
 create mode 100644 drivers/soc/qcom/pdr_interface.c
 create mode 100644 drivers/soc/qcom/pdr_internal.h
 create mode 100644 include/linux/soc/qcom/pdr.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
