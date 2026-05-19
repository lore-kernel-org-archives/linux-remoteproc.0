Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7EB3CE099
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175214; cv=none; b=VynmceShFQXXApdz0MyFqn6dnbDJo72lrfP2qfierxrRhXz3A9lrxu8u+ri5jNySfojwV61n6V9pxBVt+thWGRki2cIn5BG3/d5ZanDC5XK1wxqjKdNuaPWyByRUnQzl93VAxbXxz4ldhfHTl2lBcXxO2m9FDA6Uh1NiHzJK+rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175214; c=relaxed/simple;
	bh=bscwrSlVpz4MNHSHLLAXg90Xfda+9OYWIvmhkgv3eb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NRlj4dPw+MyM9uRC4t50LrhW7BLoZug+t35hPCuaIdfruAenzCS/xARp51wf7fpA4/yLef9j51afvc+uc3/Q61rpXo9omWy2SWMlE8UsUPOrarXH2d3iInQHbrWPh1bRLFiqHIrAZAvoTWO6kyWeWsaXJXWMU0uOM8X5+8HGeBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKAc4p9g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dFre4VJx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKAc4p9g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dFre4VJx"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5a8wc867050
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O1S35uCyDNCtXUX3buUrp0I7Z6/lE+g8Tviz/lzBaZw=; b=CKAc4p9gnBjwH9JL
	eORX2pCQ0AvZGNqBpWzoB2ngw3KUf4/xOpogpDuiwsC+e+iSA1nKkU8Ague2fxRf
	YhCmoEsCG06bo4IC5lqhQJsef2Vr2+RQx8xva11EFiKwZx6o6iRVBkhDbC0MKjCy
	4W3FopKzqH74Ueaj96YQUOGUNWF38GNBDqzcMSBYNXN6zJM45GHVI5812YadE7zZ
	Y1XWiNgVhQiqZGjsXxSROKHIdLSyAR08kPAfVAYjvggxSR7X9MSPvpTab/syGz8L
	HOV3iRoOuQxI9epLCV03dOcXHgPrm5S1SMk84ekKmjkAAHDKSFQwEDXWJkLOlEmi
	UW5ZQg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8hv1gdxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 07:20:11 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ee34588671so3722648eec.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 19 May 2026 00:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779175210; x=1779780010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1S35uCyDNCtXUX3buUrp0I7Z6/lE+g8Tviz/lzBaZw=;
        b=dFre4VJxzpzWEUNsIEY6NS3zWugL3ML1voTbbeKdHJtSlm6ymvIrMZeOqN5K8NdP0o
         3L/1vGg8HmRTfFg5iPstpy2KpHS+EivdTkUMBihtJBoy360HyvFaLbt8JecA5PPSd35Y
         9cjrEWwdDHqo0InonzpykuWCPgsDKqvLPW3iptnU6Qp0Rfe12Aw8SORzl+7XDizl/Y9D
         tYud9qVGvj3I1k/CY0EREOKykGDKXzfZYz+oNBac5Lip5xTlD1NCuUWNXBgLk6CycpMn
         j5QiGm9ofyyamz+1RbNvb7Ce30KISM4yVMw1c7CGwX2iSG4J+XfVfbJUqT+bvW6pBu8d
         ZHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175210; x=1779780010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O1S35uCyDNCtXUX3buUrp0I7Z6/lE+g8Tviz/lzBaZw=;
        b=akjYdusTas0Q3NkifCJ0Ggt6MVsfm0Q0B5LxrNoIT7uusRh9q0eA+DLpwVecPKGVBq
         9wGK5gVEfteCAMyoNc9aQZUghIu8Jzz8YA1nuqvK44nQGa2SZP083qJ9TQQHFFPzuYHE
         o3H3U92DUchBrZAQC6POQsIUYwBdgUzUns/pGnjS3vF9flp6xIh+paYSfoC/TyPjM5ZV
         7/m/DC0eIq6hNY0SUXEem9IOMuO3TWcX98FeSN4HvWO0LnpXYawX/r6plYDeS+WUY4vm
         Bdvd0LV/PUh+lS3cwXo7JFzIc/ZK4QbcLWvS9W/8A5oNJl7z6CeOflbRCZXkQAosU3Od
         TO5Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Q3gmbw1Oua5e0aCLdxH7GM2/AkwB587baDWrFvC8KVnAajLLPlYPs5OQYWPGzDR9yYFXc9BTsxzYxqJLj3F0/@vger.kernel.org
X-Gm-Message-State: AOJu0YzZO/J0xwxjrh9pP1AKAlZO8xGei5FJ9gP0e3Vt4kk0A/8ePNcy
	PY/S1OuRK5so0uWN3ZFntVxBbEScY7RXJHTAiZtVau8iAVDoCndNORH+rg+dRXVssepKbusK6el
	X5RXUEuZ8OjEKAZQEWbjyj9n8VIGV1LGlbe/v8XjwGA4K8LVVI7XLgIHVnEyO7CeSX3p43lvs
X-Gm-Gg: Acq92OFyapJ92fbKVQIYAUqSOrvz9dvPyZJ0asE/TqE20K7l1+UgShwPL8ZXzHgAFmH
	wKNLqeVVY5DovAToBL1S0xOMvZesDkDnEm45d0BlqWgi0d+kdBsmrwkOd42zxDG2t/0ZeH2M+Gz
	ujSh8yedrCmSQnalKQeBmpBdNQTTLgjt6PXQMzsnD67n6hTzsfJz8/m8QswHgfZP0wXlfza9xmA
	1UBjX1reFqGu637AK5I7D1LCD/LyqEx8RCm1eFQJgSnIifu8PqJX6O11ZaGerIgoFFN6Uf9uXNg
	zK6zEiKILsx1NIqDYrAYq71+SwFzBh8JFZBz+ThnwaqEydNSsmKV2BBKn11UD0jMrRNGiQmdvtx
	ZvppOSt6thpRheBpYlVbe0EwSyq2EnPX/BY6fLwIB5JyWBUlryaVhTigD4T+A9y5Q24lBsTmr
X-Received: by 2002:a05:7300:b2a5:b0:303:a1af:5042 with SMTP id 5a478bee46e88-303a1af60eamr5200988eec.0.1779175210295;
        Tue, 19 May 2026 00:20:10 -0700 (PDT)
X-Received: by 2002:a05:7300:b2a5:b0:303:a1af:5042 with SMTP id 5a478bee46e88-303a1af60eamr5200970eec.0.1779175209709;
        Tue, 19 May 2026 00:20:09 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bcd0csm16438595eec.24.2026.05.19.00.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 00:20:09 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 19 May 2026 00:20:03 -0700
Subject: [PATCH v2 2/3] remoteproc: core: Check subdev start status in
 rproc_stop()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-rproc-attach-issue-v2-2-caa1eaf75081@oss.qualcomm.com>
References: <20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com>
In-Reply-To: <20260519-rproc-attach-issue-v2-0-caa1eaf75081@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779175207; l=3054;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=bscwrSlVpz4MNHSHLLAXg90Xfda+9OYWIvmhkgv3eb4=;
 b=7a/JGryUVN0w5oetGmN7yC2k9A+joMOvHT2gMeXi/YqWlK0e5Hf35yZ2O4vXLQq1SvHX+5OA+
 vCvF8R6Yt5/DhH+FRCVplqk93xQ3qu3orBx+EXxTprF+xn6i7+xvyM+
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MCBTYWx0ZWRfXxwYIXrv35qXb
 +6ZMeM3mQIujmxiwQES48nN5T0FEtdxY3HSB89bQB1H+OJZ6mFPSMIzr2Gy3zXwSNsb0imlADfI
 AMb0JaboYD6dmwK01kx09piRBdcv4uJOVbSuzvdrClTRMjAZ2G9nNlAT22YtkZFxmgazPBK56Bl
 b75YaVnlUD2a6V3eeEFUcVQCXsZD5NLxnaS7IOsmc5VF8aJMhe3PrpLySPLOAvX+DQQGszYoyRL
 n0fCxQ7M1Q06W2n8OjxRlAvDC4F3A5zZap2VVXzsEZi+FcvjOV62TWs71q7pm59NJLrkkERR6jm
 4TL/QX3cu5fvAIY/2frKEAaM6xeJMASUVE7qtF21J57QtvkiJktwixKjJdV5HueSax9YhLLRWpq
 Mkq3WzRorF5sal4hnORqA8LNExkBcpuzLEqCNg3JIGh/XPQxXsGhDIq5Rzn7LdCNwnxRhxG3V8i
 p2KTNDgxtEdwpdKA62Q==
X-Proofpoint-GUID: y80iXDLtC3TltDe7vyQHulR5z1JWlSSv
X-Proofpoint-ORIG-GUID: y80iXDLtC3TltDe7vyQHulR5z1JWlSSv
X-Authority-Analysis: v=2.4 cv=WZM8rUhX c=1 sm=1 tr=0 ts=6a0c0f2b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9H_D3iXqDRE50K2jjPsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190070

For rproc that doing attach, rproc_start_subdevices() is called only when
attach successfully. If rproc_report_crash() is called in the attach
function, rproc_boot_recovery()->rproc_stop()->rproc_stop_subdevices()->
glink_subdev_stop() could be called and cause NULL pointer dereference:

 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000300
 Mem abort info:
 ...
 pc : qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem]
 lr : glink_subdev_stop+0x1c/0x30 [qcom_common]
 ...
 Call trace:
  qcom_glink_smem_unregister+0x14/0x48 [qcom_glink_smem] (P)
  glink_subdev_stop+0x1c/0x30 [qcom_common]
  rproc_stop+0x58/0x17c
  rproc_trigger_recovery+0xb0/0x150
  rproc_crash_handler_work+0xa4/0xc4
  process_scheduled_works+0x18c/0x2d8
  worker_thread+0x144/0x280
  kthread+0x124/0x138
  ret_from_fork+0x10/0x20
 Code: a9be7bfd 910003fd a90153f3 aa0003f3 (b9430000)
 ---[ end trace 0000000000000000 ]---

Introduce "subdevs_started" flag to indicate rproc_start_subdevices() has
been called successfully. Ensure subdevices are only stopped if they have
been started.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 drivers/remoteproc/remoteproc_core.c | 4 +++-
 include/linux/remoteproc.h           | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index f02db1113fae..6e23cb11e515 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1308,6 +1308,7 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 		goto stop_rproc;
 	}
 
+	rproc->subdevs_started = true;
 	rproc->state = RPROC_RUNNING;
 
 	dev_info(dev, "remote processor %s is now up\n", rproc->name);
@@ -1712,7 +1713,8 @@ static int rproc_stop(struct rproc *rproc, bool crashed)
 		return -EINVAL;
 
 	/* Stop any subdevices for the remote processor */
-	rproc_stop_subdevices(rproc, crashed);
+	if (rproc->subdevs_started)
+		rproc_stop_subdevices(rproc, crashed);
 
 	/* the installed resource table is no longer accessible */
 	ret = rproc_reset_rsc_table_on_stop(rproc);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 580d324a1e8f..bc6adbd23827 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -539,6 +539,7 @@ enum rproc_features {
  * @has_iommu: flag to indicate if remote processor is behind an MMU
  * @auto_boot: flag to indicate if remote processor should be auto-started
  * @sysfs_read_only: flag to make remoteproc sysfs files read only
+ * @subdevs_started: flag to indicate if subdevs have started
  * @dump_segments: list of segments in the firmware
  * @nb_vdev: number of vdev currently handled by rproc
  * @elf_class: firmware ELF class
@@ -581,6 +582,7 @@ struct rproc {
 	bool has_iommu;
 	bool auto_boot;
 	bool sysfs_read_only;
+	bool subdevs_started;
 	struct list_head dump_segments;
 	int nb_vdev;
 	u8 elf_class;

-- 
2.34.1

