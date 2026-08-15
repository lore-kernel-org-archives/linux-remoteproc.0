Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F243B813C
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800354; cv=none; b=QvfD3tPilW2CXmg1f/OsAfnAU79jcX40Y9weuf5WkS+ZfLQtO9DigSu67eFGXIX9ldXd7lwoh5bRXT87ue3M/715M69VHBtvhIMJ+jWJ9Z74a9u8gT6vB4+vzhdt4CtTI4+gjkOqZFQ2GsghBzadw8w558sOxBQGdJ+uGPtNYfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800354; c=relaxed/simple;
	bh=mon6vIQ7udAC3IO+RUWfJ16cTVpYJMcgU5scN/63gyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X9bXbnGL5o6t+MfezxeX1LCuHE0/g/YN+jRPPDjyfgN6UV6eurQ8bC2EjP7OGpSD/pZPSaRwZJs0S8KhIoqToagyPePBkYBvkWLse9egSXuR2GAZDoDrbC+9FLHAM4RfmTexm/o/NtU0MxCYLlzmoSw4qUL1dOWigMKmpv3A//s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IHN65ENQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FhO/0JgE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IHN65ENQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FhO/0JgE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDMt6T979387
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:25:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1/hdg0OylVKiWSO27FOCcJnhdwLfCiSrmgx
	UQQy/kgo=; b=IHN65ENQngpX3PtJhuBoW8dvtpyaKxCgHZvDJ+rmW79z6ZENK1H
	pFyIQw1v61KnDlELObpH1LXJNSzeQA21lM5wUzhnehfcMmHrE5IkVBfyfFGepYNW
	5Uj1CttmKFGjl2rHse0Nm2RbzmCLySAWG3ehhxhNqz7XaOXhW4rUm2XT8jXvyjkv
	PJzt1mF9yOLOH+PmjH03rM+0m6iscxKj15eM3UUd4vF9UZ/OCsC/WZ0fj2f+kt4R
	0HI5/xvmJWnD+kl3ZMCGev2t6PNoTaaEGMwYkhFRk07T6RFCEhPYFkL4OmNLX+x0
	cYws3QAHPIZq+vd0+FnKicSEvmDcFsd3Brg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghns11g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:25:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbedf6e8a42so2364359a12.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 06:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800351; x=1787405151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1/hdg0OylVKiWSO27FOCcJnhdwLfCiSrmgxUQQy/kgo=;
        b=FhO/0JgEYWsHNuaZ2T07jAvBrAmYClyrA0h8fq0P5QAOG9dqPIA7SQ8rDMzN/nluVa
         xzrdkgXQ4oMAjbazLlrs+5aTehEev7+hgSVBGDYfWh//hYe8Fj0aSbOXE7O/iFBOiHyq
         ShAmACrcBkNDz5PsL+xEldSqa49hPH3V1XRmZjzd3tcnLhMn8j5rBhJRVc0XVC9vTNXt
         gLuZOc9N1OTSWRT6o5rizJcB2oS9YAzKHr+dWWu+KJtTha/3XGU7HAFdxd7RPFLEDQBK
         HAVhY1I1In0xtH9zhPVQxaTX8aV0HZRnrOE+6OVdeLkMS5cg8V0c36uEjSv4A7L5DWWJ
         gCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800351; x=1787405151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/hdg0OylVKiWSO27FOCcJnhdwLfCiSrmgxUQQy/kgo=;
        b=Hr8peUORPBv4KJQxA3L6g7Ypl3geuOIyNKmv1VXuF80y9H8iaXcR2JHtzeI9QqbhJh
         h8nEEqJCNr41ZeGdxQdwuu9Mdsj0Jyd33m0dsC5gWPB6aJWFQlbu5xE4VhZgwRSIR0zd
         yklHW/l4M7q9bdpGtXd8mtiUHA3OviFcR6GV2Dq+9vOpoPunOwz76CjW+7wBQ8xNIgkR
         zFewBlEbUEfO7sVW6dAIZEhhHt9gqi41n9dNF65Jj2VnHyzkMpxYffCIc1ydhb+CXvzW
         KGP4Yodehn85H+cVU0s/I3pIUmuRwTuRr9ObJXYTno/8D8mxMtowMkJ7XZ0AC4pqo4Pu
         8UXA==
X-Forwarded-Encrypted: i=1; AHgh+RpYYVsecYCAVD4dYdsTFgkccSocDu597Z0DGvqb2WZeGlrVj80aWWE4h5wsXkF7Qxt5kd2VDIaxBlDk+AT/HjOZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzVlnAVyI/O0mgreM6fIgOJfZshGsEqwyMYuQyXC5hvkX0VXahW
	sezMKgXhs4xpgU8h+5hUYIfmaWQBpWUx3Sv6MCxiXq813ZHQcVDatPk6FOfkmYZjnLkMIBvUH6N
	YTrMoyFhtKI5zooxoF1xHOTRiIg4rfOjUIlfBUQ3BRalptCXvD6B4SNfuZkByvBnImLtojvCm
X-Gm-Gg: AR+sD13pO83GS1D4iKzpbk6XR4DKEVZ+nYbrHMaNTdqEkgwyMiB3ckIJKT03+R6URlS
	aWEmHffv4oYOj3KECj4AMXC/aN7dhZxZjmPHXr0O0w7wmo8JgU8MZwOvCuSOSMyXsj55BTdUZsr
	RH+hZ8gDZiC7Sw3kxgwwTTLfkPcAFfSm3pS0gTf0Xy/d5r+n1+vk3ze1cxhTQd7BmzpTgEGg+DB
	s6PlLabGNb//cmNBa9fIgW03LMhBiqb96uarNikQW29d8VVAYKNC2l7S6cWcFL3k381JIcySyed
	d24ry8pTMK6EBBiEW5WNfw39zZ/9vBotIO8jeNt5d7uTShfxZLfG67oUPTv2AzZUzAhBvTWuPZ/
	vcar3eQFf2mpsWMD7ZOkmzZol3w2qUN25X+w/BdSNtkfKqJV4S8C9aR2XyJXA
X-Received: by 2002:a05:6a21:a94:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3cc71d78478mr15320366637.18.1786800350821;
        Sat, 15 Aug 2026 06:25:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:a94:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3cc71d78478mr15320326637.18.1786800350337;
        Sat, 15 Aug 2026 06:25:50 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:25:49 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/8] remoteproc: qcom: Support the Nord HPASS ADSP cluster
Date: Sat, 15 Aug 2026 21:25:33 +0800
Message-ID: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfXyvPSbunjxIXg
 uT3sQ6kNL+EGVVeyxBwkU8Q6wVRh24KAwhv/Ocy2z0umAXRFlo9yLIIUAh2V9KXmOrW4T9Vmf9+
 Ul8nEFQHurNZV5y6q2TBP6Ty0HGLSUxLqjTzVBNfsPHY6BtR06sFaQgGHEwodJsueREo87+DRAq
 cD/Wz3deZaFencJKkY1WztsS2yw0PJXGlQggjVIoJUqXP1GzuYuulS52OfdDSRjgvZqcUVzWG6+
 WAnJ9JnU4p1hC1PT8Z6WQ2e91eS2utIPibc80sixuLwVYqo+EgOkfoDdTdA5fyNwd6rpAUQ3FBj
 paa3Et6J1aylD7sR2mgYor34q38EeK3hg4+oYicCh46K2n8QnRDR/B30EWQ6Z+2j30WzFofE3tj
 mHr8chgaYxkb5/p+XZ3qnEx8lKfRRkkyO4vqXhw8v7SMiU0tlelLWeYhS2iGy6YMlE2Go0bJC7c
 WONpBgCCKnwY2c6Am2g==
X-Proofpoint-ORIG-GUID: uyj08UboGMyVNcDABt3DX8oCM6p4VHfX
X-Authority-Analysis: v=2.4 cv=QN5YgALL c=1 sm=1 tr=0 ts=6a8068df cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=2qs_MHxpMbuQh43gsaAA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfXyTa3oIkEZevT
 Dm1atcwjyJsHZgHbCKGCZ0X29lqL031SJSiZzhCVM0GtQ0pTuprzV5C0/21FKsY9qNS2T7WSrHa
 1vXtzF/FEPwWum84UeNngh+3+U2byBg=
X-Proofpoint-GUID: uyj08UboGMyVNcDABt3DX8oCM6p4VHfX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150096

The HPASS audio subsystem on the Qualcomm Nord SoC has three QDSP6
instances, ADSP0/1/2. They are not independent: ADSP0 owns the resources
the other two need (PLLs, AG_NOC, RSCp, CESTA, THROTTLE, QTMR) and
initializes them as part of its own boot, so ADSP1/ADSP2 can only cold
boot once ADSP0 is up. Their firmware also cannot tolerate one instance
going down on its own -- stopping or restarting a single member leaves
sysmon/glink_ssr notify requests to the siblings timing out, and the
whole cluster unable to recover without manually stopping all three and
restarting them in dependency order.

This series models that constraint. A new "qcom,cluster-root" phandle
groups the instances; every member carries it, the resource-owning
instance included, whose phandle references itself, so both cluster
membership and root-ness are answerable from the node being probed alone.
Instances without the property -- which is every PAS instance on every
other SoC -- keep qcom_pas.cluster NULL and are completely unaffected.

Two invariants fall out of the hardware, and are implemented
independently of each other:

 - Root-first bring-up. A dependent member's start blocks until the root
   has booted.

 - Coupled, two-phase teardown. Stopping or crashing any member takes
   the whole cluster down. Hardware testing showed that whichever
   member's PAS/TZ power-off happens chronologically last always fails
   its own graceful shutdown ack -- both the sysmon SSCTL QMI ack and
   the SMEM-bit/IRQ ack -- regardless of whether that member is the
   root. So phase 1 fans the stop out to every participant concurrently
   and waits at a barrier for all of them to finish requesting and
   awaiting their own ack while the cluster is still fully powered; only
   past the barrier does phase 2 let each member actually power its
   hardware off. That way no member is ever asking firmware to ack a
   shutdown after a sibling's hardware is already gone. On a crash the
   cluster is then auto-restarted root-first; an explicit stop leaves
   the ordered restart to higher-level policy.

The remaining wrinkle is that a cluster member must not send SSR notify
to its siblings, whose firmware cannot handle it, while still notifying
non-cluster peers such as mpss and cdsp. Both notify paths therefore
suppress receiver-side on a cluster id: sysmon (in remoteproc) and
glink_ssr (in rpmsg). Since RPMSG_QCOM_GLINK does not and should not
depend on REMOTEPROC, the id is a plain opaque "void *" cookie on struct
rproc, plumbed down into the glink edge rather than looked up through
struct rproc from the rpmsg side.

Shawn Guo (8):
  dt-bindings: remoteproc: qcom,nord-pas: Add qcom,cluster-root property
  remoteproc: Add cluster field to struct rproc
  remoteproc: qcom: sysmon: Suppress notify between cluster siblings
  rpmsg: qcom_glink_ssr: Suppress cleanup notify between cluster
    siblings
  remoteproc: qcom: pas: Track HPASS ADSP cluster membership
  remoteproc: qcom: pas: Sequence HPASS ADSP cluster boot root-first
  remoteproc: qcom: pas: Enforce coupled stop/crash for HPASS ADSP
    clusters
  remoteproc: qcom: pas: Add Nord ADSP1/2 support

 .../bindings/remoteproc/qcom,nord-pas.yaml    |  17 +
 drivers/remoteproc/qcom_common.c              |   7 +-
 drivers/remoteproc/qcom_common.h              |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c            | 524 ++++++++++++++++++
 drivers/remoteproc/qcom_sysmon.c              |  18 +-
 drivers/rpmsg/qcom_glink_native.c             |  20 +-
 drivers/rpmsg/qcom_glink_native.h             |   5 +-
 drivers/rpmsg/qcom_glink_rpm.c                |   2 +-
 drivers/rpmsg/qcom_glink_smem.c               |   5 +-
 drivers/rpmsg/qcom_glink_ssr.c                |  36 +-
 include/linux/remoteproc.h                    |   3 +
 include/linux/rpmsg/qcom_glink.h              |  10 +-
 12 files changed, 627 insertions(+), 22 deletions(-)

-- 
2.43.0

