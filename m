Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795677363;
	b=bbWtSRATlxXv4faf+oeAuBU0yLlCI/fkGrgpEWwkVjyBaGiWmHq4ZCWHyWwSV44DIqCo
	 /bKeoqQ/rnYEf7ldJwmwbFXI1Q7rhcW+AmBFGxLuLv8sNhkOPQCA9lX0yoIgAtbazwzZR
	 FvRv/llfZ8TUQ4wI8aKZgaBJ9Rpe0S95APP19+Yb3TNp98oIOEILIh772aGOnd8zFsplU
	 1SorCKRUhUxdTRY2MLuRik3pcVgxnDZ4V3HdzrM5lH058hJzR3PdQ7qYAfqJGPneINJSM
	 cE15CEZu1iVbQODQWkVIJnx+SOK5TDU7EmhGVvkassEDGzg22MYgyI8E3BRUwwHBfjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795677363;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0Pu1VpTNKn8tUjC7OT43x/vPS7WAZc6+WJ71ubu4JVY=;
	b=jFqFfgqVjZBrXaSoV4ybJCf8X6ekCOhETx6J7aYCAZq3txrM3oScjzJrIM1Kgquj9j+Y
	 xGkdUBr8APpZs3FSZPzwt7T5musoNhqLbgOJgZ641Szt56qqOjGsmjxvNsh36N3+Oxh61
	 DSibFfg432UJROnPhLDBuPkCuuGHQWqvNAHWRAwcFKUBIjHDB+JpoUn2BLcd0CJlIWO/j
	 DURLy7T7/Nsruhsgggop2sdAC3vEM6z6tEDNeBtN8qvcvUbx7OAtHf/rGBKDAek/YMVTV
	 KRDuI4xsrlr/RFFbErdEki91GjokMzBh9qN/YciaSJhwy9sRHSBxhZ7AYxOoPHWaz4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZtfB32y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BnG5oBu3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15A5606A32D
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 07:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D15A5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MZtfB32y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BnG5oBu3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B2AU2210764
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 07:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Pu1VpTNKn8tUjC7OT43x/vPS7WAZc6+WJ71ubu4JVY=; b=MZtfB32yrA0sa7Xf
	H7s6SU+7Yzl/9yqyFSFt0u3Bh7r/fYVJhq1X1Th97RdzOZVt7lYUD/G3J5+QdKvm
	+RTCXmgkQXEsm/ymFjedTFnPDZuzUMM77uBnDIAOnJbj9zaUVJl7hOp7TjuasUXy
	2XiKGrnEAylwfmGeyhKThY1USS2d1dDLfiN7ylnrkq5NyskLF1nwxf3wmrbiKprV
	6IA0R1lW3008yqx+lRVsBL+BMextyCbTOVGIhDLcCaMQS6QnJiMdUFhVNjSTf1Ty
	vcsm9b46098jZCDx4sPN8sr36QJZb/Cz2i3uy1ayABJ5Fciqx4Nv7wGlykrCm1sG
	mjO6cQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j66qf9s0x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 07:16:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a05a4396d2so5295958b3a.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 25 Nov 2026 23:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795677361; x=1796282161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Pu1VpTNKn8tUjC7OT43x/vPS7WAZc6+WJ71ubu4JVY=;
        b=BnG5oBu3DOW6SYd6mWZsyeVFhAONgAHcOCA1V9F+LZTU9t4epT8xOxBvQw6X7ipM9/
         JYFY6d1ofnena6Ln2IHFPbHsANG41G1c/qm9GxWiD3DIETl2XTC0vfmlvODcanJs6kKm
         eKAhUM3oUXSdMu1Kvhp1TlU1VTO9A1xUXxuCZRQcS96qiB71VgHfnkhFpUWZ4YZPd65S
         ElYaRucAhSvSAeFEbjwYSpsmKnCtXYFjyfKflPDfXHvx9bF5tFGT6woh6znne/lC+biv
         aOW9KLwAzwRH3cvg9qPuzBmoArWKObTLTe37KEZfmNNgaMciKepRmjdkJ+U3SCz9jDAF
         IQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795677361; x=1796282161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Pu1VpTNKn8tUjC7OT43x/vPS7WAZc6+WJ71ubu4JVY=;
        b=snaLit2nUSEXsjZIygidU8+YCpClzL3LbJjbr36mROikMKDc3DsMdBdWAxKndTP83G
         zq1nXeJAchGvFgaynjt+YsC/xE+DSl/2H1xLjD1x6RxBmG/HgzL9a8v2cEQMkEUn9su2
         +cMmQNthmtwWlVgetNMgCwmpxZ2tSSStiGuf7S1jzZRWJaQz2qO42TSM/tvlWFsAduTF
         ipCW3HT0EGMGh6+3rfkSC/Te2rDsIklRDBiYIcWyvnv+W41dzmmC1Fi7Kcd3LEh3sQeD
         937DkuGvfsicAPWoGYDlsmpLqWa0GDzJumsmIrPk5NF0TiW7BvMl4SOL6DUKyl3PB5r1
         aDAQ==
X-Forwarded-Encrypted: i=1; AL+hErHaHCNy13bPkZZDJk7zEN6V+BpZaXHi58rMQiE0BO8DrLBa/MXuj2R9bwUTzevVQdy/7BQQ/WSW8ZfyDaEeVOOu@vger.kernel.org
X-Gm-Message-State: APuU4Z80n7yfVT1pqMi4NjZCbcamj/1eVYmOSdmO642g5ZrbqYIWGuyt
	XCokvjcdh6Dl3NBTV5IdUfaZcvd7k2kQiOre000AMpOWX4ih6tI052WOPKT713ZfoxfNBvEiDaL
	6xUTMaVffKNT4OgQD+EBPp402uWvb5UCCLuDmijmHuepfB7CQITSDO7ZM9OXgX2mVrkIyqcJy
X-Gm-Gg: AZFdTZf77wUW/CBZxVTRtFGGqoi9fvlx6ffMZS60Bc35nInlnzS/0YW0iUjK1WMypFd
	pSYyBBBXVr+iA2M58xplWwiSkD52ezCVnONk2Uo7YNGgR5S50fmDVZAqkDNfcYzMs2PcOhlyzRG
	7DPt9y8JGiRUgOH8wxlLAEIRwtn3GvvM/COxnMHP9Qj017eYYfm2z1U9al81DUmzJCBiq07ZkuV
	fSLr/19/3wtPBXKkYclWE6yE6hPB2EpRegrMGCht7OpSbZK9Hvmgc1gASAqJmbmCjtnzsOQzogI
	jrFd91Li2Rm2Ncx+9vGXQK2uYOtZyf/A03ElGpVhKKRZxcal/itS1H7eHJsZcT1wvTgOmaKcnkB
	4yb+OdkrF8FsBea1dhbKpd/xc5xJkhQZc1qSTd1FZFnGyzA52pKsP/86ugJCjyQXtvJD53BWbK1
	lI618yLJdMKbVdgBP+2aeQJ/9WiQPx8UqjLLLhCmJVCNkaWv7cNMAe0ve2aD1D
X-Received: by 2002:a05:6a20:a10e:b0:3dd:85a8:4c5d with SMTP id adf61e73a8af0-4014ce59181mr21114633637.36.1795677360630;
        Wed, 25 Nov 2026 23:16:00 -0800 (PST)
X-Received: by 2002:a05:6a20:a10e:b0:3dd:85a8:4c5d with SMTP id adf61e73a8af0-4014ce59181mr21114610637.36.1795677360140;
        Wed, 25 Nov 2026 23:16:00 -0800 (PST)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4c43bsm10050690b3a.26.2026.11.25.23.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 23:15:59 -0800 (PST)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 12:43:56 +0530
Subject: [PATCH v4 3/4] remoteproc: qcom: pas: Add coredump support for
 secondary processors
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-oob-support-glymur-v4-3-ad4ec5dd4b0a@oss.qualcomm.com>
References: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
In-Reply-To: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Cc: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795677341; l=5468;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=2d0SOkI6zLArKtjYfcZ7+42dKn3PmzzmWH7cy471vyE=;
 b=cAFHRI1gnmgai+3tDn4koqrmfA8PFlx1Q5JXeT4ykWbstYjexGt6AQuBYchbPXroyDLLOa6lt
 9Jm5+vC0sVTBzfN0AK62gRXqCzOv72spY4YUehBmL7nI0ZesMPWhqx0
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: FmFiqDm04VXpNGklEQs7X3-BgiRoWQ2c
X-Proofpoint-GUID: FmFiqDm04VXpNGklEQs7X3-BgiRoWQ2c
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfXy3zyTuSUe0Rh
 u1eOP8OzUpTES6tMO27JQbixEfuDLoec1IaeQgCkFKbISCkYjEl2HXofelvvX/NrH7f1JaBZmdG
 UGTpPhD5ujCWUlrgYojuavWsaBd/t/U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNyBTYWx0ZWRfXx7BDx7zvyQKE
 tLBTeZeg3K0pj3QFgUGXTnAQDHmnDrCuZCrWtZJXgXPG9X3jDCp/VtKe7Zh3pktt+WRaZq/tfk7
 WcrQAxSJiOGlcEJu8gvco0VrjA+VZM/tnaZf6TnpEulufTh2h2ZfcXydeGdy544NJRAvMTYt8+/
 LQ4HSIk83MUTKUKTOjoqj6c1BGhBABB87X1L/upBeJjP/gbRWxWSN6ZFiVLe8oUUmSkr0DdujFP
 XT862yNJ1VHsRTg6orbMnghA26XxBROQqGRZrTqGym1SdhAOrJbMmOYLSzxMzqFPhqXIbg3bydf
 40/EDbAz8bUPzgNHV7DHT1YMUJNZphrXuKz/xSIi+28QXC6qFu+hd8HM2Chuv4rPYauYWaoX+H1
 ZFRoPxoG+VjONlWT0FVSfN69ZfvKOB4C70dVY8Nkh1qBrz8UzSc7h64RHvJ1vFB0+u/qAiEINbN
 FkncVSli80WslrtywMw==
X-Authority-Analysis: v=2.4 cv=Q5VHcI2a c=1 sm=1 tr=0 ts=6b07dcb1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VHu_fzJLF2dhDldusg0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260027

Add coredump support for PAS remoteproc instances with a secondary
processor by registering dump segments for both PAS firmware images and
temporarily mapping their carveouts during collection. This is for debug
dump collection and does not provide operational device recovery.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 81 +++++++++++++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 1e51371e445f..1e55b00357c8 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -138,6 +138,7 @@ struct qcom_pas {
 	phys_addr_t region_assign_phys[MAX_ASSIGN_COUNT];
 
 	void __iomem *mem_region;
+	void __iomem *secondary_mem_region;
 
 	size_t mem_size;
 	size_t dtb_mem_size;
@@ -185,6 +186,11 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
 	memcpy_fromio(dest, pas->mem_region + total_offset, size);
 }
 
+static bool qcom_pas_has_secondary(const struct qcom_pas *pas)
+{
+	return pas->secondary_pas_id && pas->secondary_dtb_pas_id;
+}
+
 static void qcom_pas_minidump(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -611,21 +617,44 @@ static int qcom_pas_stop(struct rproc *rproc)
 static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is_iomem)
 {
 	struct qcom_pas *pas = rproc->priv;
-	int offset;
+	phys_addr_t base;
+	void __iomem *region;
+
+	if (da >= pas->mem_reloc && len <= pas->mem_size &&
+	    da - pas->mem_reloc <= pas->mem_size - len) {
+		base = pas->mem_reloc;
+		region = pas->mem_region;
+	} else if (da >= pas->mem_phys && len <= pas->mem_size &&
+		   da - pas->mem_phys <= pas->mem_size - len) {
+		base = pas->mem_phys;
+		region = pas->mem_region;
+	} else if (da >= pas->secondary_mem_reloc &&
+		   len <= pas->secondary_mem_size &&
+		   da - pas->secondary_mem_reloc <= pas->secondary_mem_size - len) {
+		base = pas->secondary_mem_reloc;
+		region = pas->secondary_mem_region;
+	} else if (da >= pas->secondary_mem_phys &&
+		   len <= pas->secondary_mem_size &&
+		   da - pas->secondary_mem_phys <= pas->secondary_mem_size - len) {
+		base = pas->secondary_mem_phys;
+		region = pas->secondary_mem_region;
+	} else {
+		return NULL;
+	}
 
-	offset = da - pas->mem_reloc;
-	if (offset < 0 || offset + len > pas->mem_size)
+	if (!region)
 		return NULL;
 
 	if (is_iomem)
 		*is_iomem = true;
 
-	return (__force void *)pas->mem_region + offset;
+	return (__force void *)region + (da - base);
 }
 
 static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
 {
 	struct qcom_pas *pas = rproc->priv;
+	const struct firmware *secondary_fw;
 	struct resource_table *table = NULL;
 	size_t output_rt_size;
 	void *output_rt;
@@ -635,7 +664,25 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
 	ret = qcom_register_dump_segments(rproc, fw);
 	if (ret) {
 		dev_err(pas->dev, "Error in registering dump segments\n");
-		return ret;
+		goto cleanup_dump_segments;
+	}
+
+	if (pas->secondary_pas_id) {
+		ret = request_firmware(&secondary_fw,
+				       pas->secondary_firmware_name, pas->dev);
+		if (ret) {
+			dev_err(pas->dev, "failed to request secondary firmware: %d\n",
+				ret);
+			goto cleanup_dump_segments;
+		}
+
+		ret = qcom_register_dump_segments(rproc, secondary_fw);
+		release_firmware(secondary_fw);
+		if (ret) {
+			dev_err(pas->dev,
+				"failed to register secondary dump segments: %d\n", ret);
+			goto cleanup_dump_segments;
+		}
 	}
 
 	if (!rproc->has_iommu)
@@ -667,7 +714,7 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
 	ret = IS_ERR(output_rt) ? PTR_ERR(output_rt) : 0;
 	if (ret) {
 		dev_err(pas->dev, "Error in getting resource table: %d\n", ret);
-		return ret;
+		goto cleanup_dump_segments;
 	}
 
 	kfree(rproc->cached_table);
@@ -676,6 +723,11 @@ static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *f
 	rproc->table_sz = output_rt_size;
 
 	return ret;
+
+cleanup_dump_segments:
+	/* rproc_fw_boot() skips resource cleanup when firmware parsing fails. */
+	rproc_coredump_cleanup(rproc);
+	return ret;
 }
 
 static unsigned long qcom_pas_panic(struct rproc *rproc)
@@ -748,11 +800,27 @@ static void qcom_pas_coredump(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
 
+	if (list_empty(&rproc->dump_segments))
+		return;
+
 	pas->mem_region = qcom_pas_ctx_map(pas->pas_ctx);
 	if (!pas->mem_region)
 		return;
 
+	if (qcom_pas_has_secondary(pas) && !pas->secondary_mem_region) {
+		pas->secondary_mem_region =
+			qcom_pas_ctx_map(pas->secondary_pas_ctx);
+		if (!pas->secondary_mem_region)
+			dev_err(pas->dev, "unable to map secondary memory for coredump\n");
+	}
+
 	rproc_coredump(rproc);
+
+	if (pas->secondary_mem_region) {
+		iounmap(pas->secondary_mem_region);
+		pas->secondary_mem_region = NULL;
+	}
+
 	iounmap(pas->mem_region);
 	pas->mem_region = NULL;
 }
@@ -1276,6 +1344,7 @@ static void qcom_pas_remove(struct platform_device *pdev)
 		of_platform_device_destroy(&pas->bam_dmux->dev, NULL);
 
 	rproc_del(pas->rproc);
+	rproc_coredump_cleanup(pas->rproc);
 
 	if (pas->tmd_inst)
 		qmi_tmd_exit(pas->tmd_inst);

-- 
2.34.1

