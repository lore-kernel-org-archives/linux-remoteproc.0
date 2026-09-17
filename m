Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D4437A857
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789636978; cv=none; b=TraHRAd132paHTwtIseZQjeMFR+Dhe5L4Fr4Dc/70mpMJLwgQDvi3mNuKRKc0bBOvWJOWbkyaFFl0dUH+SS/n0g6gNv99ORq6ZLbaNoz0aKeOhRUq14y+QAwckZxLZ7rTPsMmeSbpkXbd/DMmjeGP+kXDVgtn5JIsshhbekdKKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789636978; c=relaxed/simple;
	bh=nmzuZyubg0gt3//chnPIsntuNPv0HEE5hrN4K2onAh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fB+qDiFQz3P15z2OSlTOjaGwfxWrQ6kxRlb81t8f1CS0YJ7AZFDLpuuTpyjf4GXsF19wCyq6CG7PhaRRYX3/7w463CghHt+ba6TVlH2tIZIKV+dgXrb9ms3i7NYPw9wln90/G3hsqEVWYqd3DZhdIF64DfhV5qYacahoGBD3y4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CAiOK6J4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRPmWrth; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CAiOK6J4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRPmWrth"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H60tXx1375596
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 09:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=52MPaQVsK93P9Ci+1dC4f+
	YeRomvaMYMgeuUx6T1Jww=; b=CAiOK6J45mFnFXDR1mHUZIMOiy1RS+Ctq9/FhE
	POOuwgbAbQdoT606283o58lpXYphEoG4WttkEOvn1DkFAp+IzNxxd3GT3AajAoCR
	SvfaAhCBl8XcWj0QwNWI/BsCB7M1Clij8ggvTW3e2lqONM8ZbQ0GGZYX+Jwlw58d
	/uSokX8WfsF5cbmXaEhWpW3JCNGF0guKUY36MNypGWflzwjx4PhnHK6IZuhsSuqT
	rn9uCYUZgZDMui+L9pQpJYgkOTBXdNCNen5LWwTZnyjAA8jzcFEYWUlXpmegKiT7
	XmvCdT2QasBkni6d7Z6mwinQzQ+9Rn1GL50XSqQqL4GB7PGQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqy6auf3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 09:22:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso610769a12.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 17 Sep 2026 02:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789636975; x=1790241775; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=52MPaQVsK93P9Ci+1dC4f+YeRomvaMYMgeuUx6T1Jww=;
        b=QRPmWrthFByPeSwveISNLFl4abYffpKiUVfQWQR869FL2vnS+ERXiKrHZVGKWPcO9W
         6d3506Ut1tXtSQHw5egXW+fJsHIlls/ju6Sp40h4lFVG0UjQGKH4Moydu/6SBtHLtPWi
         27HSyd9uq/IHCUSx4G5hr3+AA3jZR5ykawidroaiOo4VmJMIWsnAG4nvvdK1SEgdbZm3
         m68FaDRhQZ4xsAEnMxXPg3QUBWix32FElUjQL5t3j6VlAdR2a0qD8Lb7pRpqkRuEtJ8a
         NLnN7UCS0nNO9cxe3CNjuZusVJcdn9MdqOXSP4NpvhR/7Jq0WSpI0M0XpegN6Ta7ej6/
         HBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789636975; x=1790241775;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=52MPaQVsK93P9Ci+1dC4f+YeRomvaMYMgeuUx6T1Jww=;
        b=2jy/RvbFkUwn7CCgtT3IUNDDUSCflyv1M2gPALvYe4WU8giQcMlHGMSIbjiWXJ/Yfn
         oM+CP9rp2PI4uBnK6o5hAUR56UUj8NxC2EY+rr168FyP1j1osvxtZ1KkYQBjUjB0Hz6e
         pyjsIm1LBzalbmL4uvvexmCsJbi2lRRfYb/YobC3+S0yX/5AQK1IA0YSo1jGzXlEz90C
         OyqROyVe+Ue5nys2Pg/rb7bsar9uZ2jqMCCsk1WDhDXFtTlBoY3QOOeg6P3975cbTQre
         DWAVekDUnW4bwGZKYnbu5xsg2gCykMVsaZ9ppi9k2yJYAwbMnXVRlQO2yJ4m6DZvK9r+
         8jCQ==
X-Forwarded-Encrypted: i=1; AKwUvBypHsjU3W2N7yEH5T3R2IV6gtiKXHEH7qPFQBpexVM0b8sXRTTzO3k7JK66EoVoqecUkCBMO4/zF30Q2wJsCgL6@vger.kernel.org
X-Gm-Message-State: AFuF++mwOeueBpZswmKvfNLk0WaqLNYPYjyhdavpBCA9pp818BvpB7MJ
	zNMsiQJzDI3Qoc7B97lVZA7XYHsaXxKsBfWlt+D/gNIHoNvvNNA9pr1D5iUXPHDDWq/nlLN1Dte
	gqq/UmBCH3Yc/yED9RRpChli+LGZtFpYGZCilUBGAoTpOly5mCDvpsdy8aAg4GDu4TrudXhmg
X-Gm-Gg: AYBFou2PtO+mHTzFWB9vevBGD2t6xjgd7us6IzBLyOTjZ6LolQyf9t4wvTMSJFHtbNY
	IJ5J4N8VjoiWkLopB/49wx/EyHANwRmBu+rz7u1Q1+nbeR+dlT0d9B8klEXD2YodXZwWx4I5Irz
	P3jZzpuyhpJQGh9mzMsO/XzxrSloqRPOpYs1s3fQ3+bl5W2rVkjCfwoPP6fJ9PGLUlBSF27vbcg
	zGo1hSXNTWU6n+fgmmysA+jeWjOqGUex0R5Ybuok4C13fXcbNcKlxm5XBTBWVOHLxxfrZivFL/O
	7B5CdVBLjROvBRfRCOriJs6GJVIQGMYv0wHiioq5FcebIBc/q/csZS0N+6R2+eRp325S2HiBLp5
	zhriHk+/KQF2KIYRq//AvF8/0khz4VbLqOGYsBCvrlLUrAGORn5vvEEo=
X-Received: by 2002:a17:90b:5785:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39e1e50f73cmr20525363a91.20.1789636975006;
        Thu, 17 Sep 2026 02:22:55 -0700 (PDT)
X-Received: by 2002:a17:90b:5785:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39e1e50f73cmr20525246a91.20.1789636974432;
        Thu, 17 Sep 2026 02:22:54 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b0520asm15106437eec.27.2026.09.17.02.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:22:54 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 02:22:44 -0700
Subject: [PATCH] rpmsg: glink: Implement get_mtu callback
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rpmsg-glink-get-mtu-v1-1-edc9496d0da0@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGOxq2oC/yXMwQ5EMBCA4VeROZtEERteRRzQ2ZpFSadEIt5dr
 eN3+P8ThByTQBWd4Ghn4cUGqDiCfmitIWQdDGmSFkmpFLp1FoNmYjuiIY+z31B3LeVZUeos/0A
 oV0dfPv7XunktW/ej3j8ruK4bmsD68XcAAAA=
X-Change-ID: 20260911-rpmsg-glink-get-mtu-dbae4369d347
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, tao.zhang1@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com, christopher.lew@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789636973; l=2525;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=nmzuZyubg0gt3//chnPIsntuNPv0HEE5hrN4K2onAh4=;
 b=X6rwYjbG9fkHKBgwAubKaK2Urs7cuItN31PRv8K3MpPy8RSEEnJVQ134FsMaAz+4F+Wcik9xc
 SsLQ9VA3ODuCCApsAldj3EggHWmJDhSS1Kv77Rh6kG2I8SJ/gPrdkmi
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Proofpoint-GUID: iBfyik-6K-D0s4HKced7OYz4YKs60YtL
X-Proofpoint-ORIG-GUID: iBfyik-6K-D0s4HKced7OYz4YKs60YtL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEyNyBTYWx0ZWRfX5kuBqVh88Pqf
 R8P6cW69MITTdn0cTbx5IVFqK0ro4XdS6NpjF4tyv0BzqoLo7/rhiloG7bwvFbHgxrAYVt+2XBg
 6Tc+CzuICBeXaHDTlqOcQLENCIPttsHan/4LzgP4NYiUvzihLKqaja8AHE+b66j73I1E6kBrJnA
 fEQrn2KZRqHZOP+kQbOAZrakz1n1b/d6X1Kl8Vl4Th1BIaCqU5mbow5jhD7/66kW/HFxuVs5xHz
 lNQvPxi/wJ9a5WkdqXPXkMjICQ6AYwyIH68Bs2EEoJv3TSCV9hikmuMx+oeEwgSZsaib4O32+ST
 5z1zajsP4p0MxZGIJLf2vZigTx+IusNz86ia0xbvblAwfhVZ/QW1Zly92PfHyyFqFA+QwicYNVV
 6Ejjq731T8Ip38ArT7ateBC0NHGxC0qmk65MQvM2OHIiJ7IU2b/XxluwTP5rMVR9hj2bcU5iUwU
 vnjZvNVzyjJK6ohKR3A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEyNyBTYWx0ZWRfXwVt2wKA/1uJK
 rNseH0ZbYY1npW7+ZC1YdRHECFUMMCG61HBQll+SKi83H2UpkjfVwqB2K43pOWjv2HOKnRzw/mk
 wfpLIjn5x5kKzFImyuppBveH1ht1i5g=
X-Authority-Analysis: v=2.4 cv=VIRIDNPX c=1 sm=1 tr=0 ts=6aabb170 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6_0z5GgOHooh7QBrRKcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170127

Without a .get_mtu() callback rpmsg_get_mtu() returns -ENOTSUPP, which
makes rpmsg_tty unusable over GLINK: every write fails and write_room()
reports zero. Implementing the callback is all that is needed to reach a
remote console exposed as an rpmsg tty channel.

GLINK has no protocol level MTU. __qcom_glink_send() splits a message
into GLINK_CMD_TX_DATA and GLINK_CMD_TX_DATA_CONT chunks that the remote
reassembles, so a single message is bounded neither by the FIFO size nor
by any fixed buffer. The only bound is the intent the remote allocates,
which is negotiated per message at runtime and is therefore not known
when .get_mtu() is called. Report INT_MAX, the largest value existing
callers can represent: rpmsg_tty narrows the ssize_t result to an int and
treats negative values as errors, so anything above INT_MAX would be
misread as a failure.

Assisted-by: Claude:claude-opus-5
Co-developed-by: Chris Lew <christopher.lew@oss.qualcomm.com>
Signed-off-by: Chris Lew <christopher.lew@oss.qualcomm.com>
Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_native.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 55793fc18293b..ade9ca1cb9b9a 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -6,6 +6,7 @@
 #include <linux/idr.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/limits.h>
 #include <linux/list.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
@@ -1605,6 +1606,11 @@ static struct device_node *qcom_glink_match_channel(struct device_node *node,
 	return NULL;
 }
 
+static ssize_t qcom_glink_get_mtu(struct rpmsg_endpoint *ept)
+{
+	return INT_MAX;
+}
+
 static const struct rpmsg_device_ops glink_device_ops = {
 	.create_ept = qcom_glink_create_ept,
 	.announce_create = qcom_glink_announce_create,
@@ -1617,6 +1623,7 @@ static const struct rpmsg_endpoint_ops glink_endpoint_ops = {
 	.trysend = qcom_glink_trysend,
 	.trysendto = qcom_glink_trysendto,
 	.set_flow_control = qcom_glink_set_flow_control,
+	.get_mtu = qcom_glink_get_mtu,
 };
 
 static void qcom_glink_rpdev_release(struct device *dev)

---
base-commit: f2bfbc3554ca6919484030729424b9dee2942d24
change-id: 20260911-rpmsg-glink-get-mtu-dbae4369d347

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>

