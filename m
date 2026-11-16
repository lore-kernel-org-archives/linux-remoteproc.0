Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846196;
	b=lLHvMg2KqcXJNH712kc5OkVX0pOfGydInjd5J7Qv6vG7zMdMgt2Hwd1WdVmDnnlGVlec
	 Ow/eUnj5rbq/b+EXBHVyqnr4JIMF2TjLs4FoXDIsZpxGVv1DzMi9OWwijxo0kdrSJ6HnH
	 G3t7RA/iQ2PSozWOSLsH6gSjHPnmF4juLAmwVssGkWXycaTSFE49UoFvKH8KWE3pDcG5H
	 SWHPtYSTAx2mtTasfw0PxKE0t7eUOCXI/1h7R5VdklsrkvXjXokbJcqT/wqwmbOWb0yJt
	 p9oiqCnznlJnpnWs+hGmkrbAfOHQGdc22Y3xrlLhXH3zjVcVNJoenmDs9q9SbPcw1PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846196;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EPho6yeU36Z5EZsv2aujXlYhkTqpLdJTwXH4ZQGbqvQ=;
	b=s/Poo1PnMWSu4dJylyWbP4tGSdwX8OO40cJuQjDI8VFPxXKs3KEWR7QlKPrrKkQpZy4y
	 85Que4X28LbWvXLAOAgtZ5ZWOvBJ/ysBBfy+LCHcwPIBrnXH0HA7Sn02TUWoGV+UG+/PG
	 2NZKedwWQZ25iBkHh9DHPBDUPObCpB9GZq2qFZYthiPil2Kkymv7Ih4BsqTUuK35xLR3Z
	 easGyK7U+SS96F3FW2nVQKaxigidKpDR1Jd/G1nzvI3ofwqDN+yE6LkL3TK7isE9wngPm
	 slMiOLczeI4W467q1MVt1XWdFWxlnfN2lLliRf912qR0jtkGHCQnIacht2FrUcjCJCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZVZ3YHZ5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RgJAw1R4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D93B606A32A
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 16:23:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D93B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZVZ3YHZ5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RgJAw1R4
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIG791579890
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 16:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EPho6yeU36Z
	5EZsv2aujXlYhkTqpLdJTwXH4ZQGbqvQ=; b=ZVZ3YHZ59rK2FGx0nxxNalzsueK
	ClmYgIbnhi9BNOktRJNO8GHVNBEMgLHHHqXcPxVNvi4GMOLotmUfjxXjXI1/78s1
	ucWStiSfbicw1PMbIw304IpZC2pK3vRbvuC/fHmPxdrnF7eQVlFBZLqIwSr6u/py
	TbbaQx2zMOXmAJ7DmcaH6HjBlLD/GDgq7RCmnhoVh69cJ2ERq0oxCxNcB9XVD3vT
	1USdn9zmo6SfLRF3fsjYasmj/hKGi4m2RoCO2pwMpTkxgqgS99tfMLr0UXCr6inA
	M7irf1gkE0w3Jbz/mEYQuDvKBxb7mfRGxJynhqWAAAqN9eqbIL+Oo0ga+jw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j000g1cre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 16:23:14 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1af203073e0so3226537c88.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 08:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846194; x=1795450994; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EPho6yeU36Z5EZsv2aujXlYhkTqpLdJTwXH4ZQGbqvQ=;
        b=RgJAw1R4943sEz07rWePPy5rfhK3c8Pj/LRqf8QGm6cJoSOZuCm4I13MaFaP/AumSS
         VUKewYHC2l/cvevwyHOCfCAwQMfRwJnfC8/qnqAOZOuyXRfrEhNJurov33UVGH3lXQnp
         AOTOT9VKNRH381Me4euJNx3j+Q+QjjlSN4P2T4qHFwlObvuh2mCP80aBjVqWkJvT/bCl
         ejD1eF2LHxN1Xnn8N5VChagiBLpnjfwLjQALdR8OZCBh2Y83BgyCEtMoGTerZ2X1ErIv
         CpkmDne/mD7Xqy8ArdxsOpHqfGnUo4M+PN0Ga9Z1mzeOrZjwaq9cK9DJUkH9BZQ+mMzr
         3dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846194; x=1795450994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EPho6yeU36Z5EZsv2aujXlYhkTqpLdJTwXH4ZQGbqvQ=;
        b=cUJJTH94ojGqgW+gla0IaK1u07jqP0YUzwjsrLThZzHShOCovZ6/RtvsC1SF8FBFnG
         czla1/owXVabnDJu/J6Jw1hOS5pt/ymf4/QG3/U0AwbjUINBLiR0Np40fMaQ5aXOSNKk
         2WNJ8upyhJJb52lmGmgyLXOlR7I7Z4vFTJVkQyik6cTHBmCWjCulIYt6Kj2GJr0HFzfp
         gRjasy1nNmpUuoG6H3mdz5ukc7ntY7Mn32KpK7BT9qhPNz+jm5ziTs1olGN/rvjBIhnd
         rf7tkSvhOwecfkO8+4Rws8LbnQ+zTM07ZjJnWxNHwQoo+TiPapgF+S6qFRVim1y+RF5T
         sPPA==
X-Forwarded-Encrypted: i=1; AL+hErG2fgjuVb+x0KgalR+nzhsPes/Ab8ngd4lrPmMonDLldsMsTHG9EB0YOArHsfkdqlBs12+x25RIyvypCxcaR83k@vger.kernel.org
X-Gm-Message-State: APuU4Z9T/g79QOtKS3FrIpWNdaBi9Lzs+WfRbn+yT9kuBGwYHn7mARU0
	8JmqAmJcESZt1+cbGDI+YGRhl6+LEyCiVNer33aRHRV9GYNCYRPvhWp+3Fw2SQoRyRAO5m0xPxt
	kPLxsGlseYTi67ytbqiaITvtOa2tq7Gl0f79jWotPVFl1h2oimVROiqpkVW8inGvc/m/LzRH7
X-Gm-Gg: AYBFou2AAi6XHvGaBBKPpv7wNkEwNVkt4/GWy0NP9a0CAA/eu7x9Mxn4knO27MIiCUO
	/cxt+B7huV0khKa59cLcUJHzVhN2wFOEXRGt25MQw7r0yqQGLSkIjCWOEL96mArKqH2zDBRVvA3
	B2PQiEyvWlRaPoxg5/9DkSTuQdvgOh9P035d/4VnSqkaD/m6Zq5R48PAAgOnavETo33upLvPCNv
	lXihGX7fYC4QJKn/kwKAy0sIVfBiNsQObQfgmwVVGml8GQwmkBd5RmswAlJeBb7RDhA6gfUj58O
	CxA0sxAIXTLFJogKsCVriS8Zvco8EYjg8CC4/XIejJxks3liofES52ukPdP0r9y7aq27dSK88XJ
	i0kK+zPI30pBKzLIf/6y1aeWNyQqx2tOtRZNPahtmeMZAcOOKbXf/440zRL061deMSoKpMXNxAc
	hC
X-Received: by 2002:a05:701b:4553:10b0:1b5:31e4:9970 with SMTP id a92af1059eb24-1b531e499a1mr2421698c88.8.1794846194078;
        Mon, 16 Nov 2026 08:23:14 -0800 (PST)
X-Received: by 2002:a05:701b:4553:10b0:1b5:31e4:9970 with SMTP id a92af1059eb24-1b531e499a1mr2421666c88.8.1794846193436;
        Mon, 16 Nov 2026 08:23:13 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:23:13 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 7/9] wifi: ath12k: migrate firmware loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:46 +0530
Message-ID: <20261116162148.2864501-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXwymlyUb4AB32
 rW4HnzMjvYEnR2mojrcPOAIk0DvpiAxCZqKNNE3OTgGc3hMglpujYlM1VIT/BrqJ9VmyEGGahFN
 +k+UO9YkynWf5HzCZ4HmFfm4kVa2CzIwze70LbvF0Qckyfg2pLSZ0gHXwh7LksOnQNnTYNTOdZ6
 +3DdJgyGcunq1NPPe/rbwlVOPRQU3td+CdqZoL325OIK2L+1gci5gGxLnumbPkVbfhSp1vKhyAl
 BtjmZxUiigW5o+bYQUOQIzebaJRVJWO6X3txcjr/vfXbXIpWHZ0aJL/zaJoe/tVyCDLstkH8yXd
 qOzn1ejReBxob3xo7qL6IC57gSR/1si+29+vpVF0hNCK4I/tf/U9eumDa89PgQX8a22vgICi5BL
 WDqWArlkdi5Nhqdzx+/MY5rlvwCte43Uyha9UlWmfMbUQdloLXvCY7gFnnXTBgggmzG1/FE+86Q
 lxelAXM8ks56mufsmhQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX2F/r/BiG12Gw
 CaS10oAKxOCmcQ58MxHFscp5dvr71mBFBH5lB5w+QfbEe2VwKIyhZyaHyZYjxZaJ0lYIKImNr1k
 bLFmKV2KMzXMK/XJ7dE1+1CAaLSUqFU=
X-Proofpoint-GUID: GV_TxSMl692McH6ClLhMLcsoCVKDEXRV
X-Proofpoint-ORIG-GUID: GV_TxSMl692McH6ClLhMLcsoCVKDEXRV
X-Authority-Analysis: v=2.4 cv=Vdtir1p9 c=1 sm=1 tr=0 ts=6afb2df2 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tFPd4D2tFowRDCwbfnIA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

ath12k_ahb_power_up() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context. Later it calls qcom_pas_auth_and_reset() for
TrustZone authentication, which is the intended behaviour. However, a new
qcom_mdt_pas_load() has recently been introduced that works with a PAS
context and can handle everything qcom_mdt_load() provides, along with
additional functionality such as shmbridge creation and retrieving memory
from the shmbridge buffer when the same remote processor needs to run while
Linux runs at EL2.

Replace qcom_mdt_load() with qcom_pas_context_init() +
qcom_mdt_pas_load() and replace qcom_pas_auth_and_reset() with
qcom_pas_prepare_and_auth_reset(), using a stack-allocated struct
qcom_pas_context in ath12k_ahb_power_up(). The non-scm_auth path
retains qcom_mdt_load_no_init() with the caller-provided mem_region.

Apply the same pattern to ath12k_ahb_load_auth_shared_fw() for
consistency.

Acked-by: Jeff Johnson <jjohnson@kernel.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index 8a3919675134..75d3141f968f 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -418,6 +418,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 	struct ath12k_ahb_rproc_info *rproc_info = ab_ahb->rproc_info;
 	char fw_name[ATH12K_USERPD_FW_NAME_LEN];
 	char fw2_name[ATH12K_USERPD_FW_NAME_LEN];
+	struct qcom_pas_context ctx;
 	struct device *dev = ab->dev;
 	const struct firmware *fw, *fw2;
 	unsigned long time_left;
@@ -451,14 +452,15 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 		ATH12K_AHB_UPD_SWID;
 
 	/* Load FW image to a reserved memory location */
-	if (ab_ahb->scm_auth_enabled)
-		ret = qcom_mdt_load(dev, fw, fw_name, pasid, rproc_info->mem_region,
-				    rproc_info->mem_phys, rproc_info->mem_size,
-				    NULL);
-	else
+	if (ab_ahb->scm_auth_enabled) {
+		qcom_pas_context_init(&ctx, dev, pasid,
+				      rproc_info->mem_phys, rproc_info->mem_size);
+		ret = qcom_mdt_pas_load(&ctx, fw, fw_name, NULL);
+	} else {
 		ret = qcom_mdt_load_no_init(dev, fw, fw_name, rproc_info->mem_region,
 					    rproc_info->mem_phys, rproc_info->mem_size,
 					    NULL);
+	}
 	if (ret) {
 		ath12k_err(ab, "Failed to load MDT segments: %d\n", ret);
 		goto err_fw;
@@ -492,7 +494,7 @@ static int ath12k_ahb_power_up(struct ath12k_base *ab)
 
 	if (ab_ahb->scm_auth_enabled) {
 		/* Authenticate FW image using peripheral ID */
-		ret = qcom_pas_auth_and_reset(pasid);
+		ret = qcom_pas_prepare_and_auth_reset(&ctx);
 		if (ret) {
 			ath12k_err(ab, "failed to boot the remote processor %d\n", ret);
 			goto err_fw2;
@@ -1056,6 +1058,7 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
 					  struct ath12k_ahb_rproc_info *rproc_info,
 					  const char *fw_name, u32 pasid)
 {
+	struct qcom_pas_context ctx;
 	int ret;
 
 	const struct firmware *fw __free(firmware) = NULL;
@@ -1074,14 +1077,16 @@ static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
 	ath12k_dbg(ab, ATH12K_DBG_AHB, "loading firmware %s, size %zd\n", fw_name,
 		   fw->size);
 
-	ret = qcom_mdt_load(ab->dev, fw, fw_name, pasid, rproc_info->mem_region,
-			    rproc_info->mem_phys, rproc_info->mem_size, NULL);
+	qcom_pas_context_init(&ctx, ab->dev, pasid,
+			      rproc_info->mem_phys, rproc_info->mem_size);
+
+	ret = qcom_mdt_pas_load(&ctx, fw, fw_name, NULL);
 	if (ret) {
 		ath12k_err(ab, "failed to load RO firmware %s: %d\n", fw_name, ret);
 		return ret;
 	}
 
-	ret = qcom_pas_auth_and_reset(pasid);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
 	if (ret)
 		ath12k_err(ab, "failed to authenticate and boot shared firmware: %d\n",
 			   ret);
-- 
2.55.0

