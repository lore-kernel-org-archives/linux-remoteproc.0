Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761642;
	b=21LEyzE1dCdI+Dqr81bL7BJUDN/qaUQhYBBWwaGEYCtb3xifQi0RrJWNRvJaksqJUiDd
	 +xuFoMXuFmJbza0YLWmJYcqHD2GST2ZHzQzspzQbx+HVjHF/75ylMWmnaYjSbf+A9mzZw
	 RRpsRhKSnqzgVZ9+JzfXN4w+6yHZzBlpG/3Z9ijSTSjPLdtcnb9/jZrOGUpujdFSIMQRK
	 ETJhnJxqIL1853wxRjmeHaxdlIBMae3K+lLnIUpBuTUTIjhfAZ1S44GeWThtbPd0S31XJ
	 87lMoOPOimoaFMlg8GTBkN/GuwgXE2MK/74tGdPs3264Okmthk1sitpIrwYhQmVY3aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761642;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=bRrzB/KkTaa1+WiNxi4IKNNZoBX97IDYEwXzZxsgxZg=;
	b=lHtY/S6NhnhpbaBpPlMAJyUl7J4NIF/13awhpW9PQV1nr6KWTDg9OT+JVg3Gd1epSkhk
	 OYB9OxB79AvwmTGF6rpQ3uslW52GELGIFVlIykubmp2piYBoq3jqcOy20mbAjohuthJAC
	 k224LZG2xZUTwv/gsmVAp8HUA9HCuu/f5Yud5ZCM3dAo0zHHFqIAPzOA1mv/D6GiU+PJp
	 CzCokemSXIpGbD6ucwap4sqEgswZahT2v3/9t5NZto7/UyyXtVwH9+L1gZq/BMQldh+M1
	 dQgP4pMK9uy1RGeJeIdQtb8mJzypECB1xinHzBb8aA5qxZPr5zeaA6ger+q6GvwFBIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ghCaD60b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="i2elbC/6";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BCF606A31E
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 06:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37BCF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ghCaD60b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i2elbC/6
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR6JSU93634877
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 06:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bRrzB/KkTaa1+WiNxi4IKNNZoBX97IDYEwX
	zZxsgxZg=; b=ghCaD60bir3Y5XXcaA9PxUWmHLWZdC2/3RPn4WVNzZH9EvnG5Gj
	B9f7kb0DzQPgjSI8YBGYnMwbjGkkQpEyb9yMOKqbf9iQAQKZMw7a5qkoXeqY+Nya
	Jygel3NT0b7TqeylzCNMGmPLMzsPw2uAlXWhIkxCNMUT/9YoS/SEdBw7lM/D8WPC
	qxUL+nVlONad66nQWe6Y5kC1CkOHSo+7829QVK6eUtnqdWVRw9b48bOOxEIAv/xt
	8LxhxoNzPsBgUm7i/PffhZP6SgA1P1xCy9bEbh3/D83ko0781HP5s7RyCukctC8Z
	NeyO5/5RpIGzXd5gwhcDmHvxqSw+gka5DAA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6r27t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Nov 2026 06:40:41 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cc89e86e4dso8886836b6e.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 Nov 2026 22:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795761640; x=1796366440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bRrzB/KkTaa1+WiNxi4IKNNZoBX97IDYEwXzZxsgxZg=;
        b=i2elbC/6xVkQgcGHtWRzGzEtFKco48FTNJbdTYk4iadFKCVMushd6XlcsWWtkgzR5V
         2CeqnzhOcwVSW6m24Ws/bQyBpb9ZbzORcmXefIQ/cVOVr4GLFJEMT+kn6xj3VeVUYZb9
         41hZPzV4QBAeqy/wJ6E0HlXnZ1bXTPS2Rsd5fvvRh/oWMXB5QcwN8pwal4W53TJO1+z6
         zfF8gbypthhcJxfmRtTdQNB1DG7WeLeT/OuGfV+sQE5NT9yAkt7bvOh+S3XkZvgaucBK
         k6lyDZdASqRlI7KICHJSSpHfZrv5kFSZUpzLOn7bCpqCBcrUtvjMLulH5CZk0I8zHqgM
         fRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761640; x=1796366440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bRrzB/KkTaa1+WiNxi4IKNNZoBX97IDYEwXzZxsgxZg=;
        b=iTLrrAUHyyvWk9OKxl8khBiVrR8WAMMls/luKognn3EvF513bzL8/7QI+EhZtbzr59
         MsvWE7ViG2YPMeGYf3lG15xyDWddTb1B9j+abv58CDRIlpaa5uEEWZIRYAJTbvUlybXv
         78TKal8XUmAwVLFkFAEzanTPZeqPkRU8nnHItsuhU/oNczWysPFpYEaS6OQAYl3WP1hg
         BOqcKBiJ3+2EETtBDKotGFDxn9oMRz9VQPSb60TxFxzQgaoZBKqUMXV1GqXa3F2YJXMD
         ZreOtdHuI1DcQoJQNUOI2Wz/W9noCEOlfYqJwvMpl0za2JZ5Nwg0KRsKF5pK5aegIbjl
         oXuA==
X-Gm-Message-State: APuU4Z+LlYKOCiOmDi+ZuJ8mut2jKXRqnO+mRMkR+80k7ykEjbMHxLCT
	G1rjEVDzfBXF1QQIJrhs8ud5ODsCpIxYjy49p9RYWj0ki7zm5848Fku4qPqZp4gHiqkuCD11eS8
	6T2I4bkVEOfDEJwSVwdWkS7ewe9tUzh1JNcYaC9nNuoa8yJfkLyrb6O2qt3Dmk+AT2vBPXTPc
X-Gm-Gg: AZFdTZfo441y746N0aUXnTqniscWkiTtrYcfmod9+xlefgEXet7gc0VXcHMwSt1PZK1
	+UcgyN7AJGbf8T0hIXM9b6CgLdOvvcv+yxHCzYakH3tpdF2JFxBMd8vAXiiendNfXk7KXp1bZnb
	aYYoBeasPm9IidYRn1kR9L3MyQwXT4U5sH8J7opmC7vsPErn/RpSUvqm0MVuwcRM0NCi7lrM5oi
	v+CVv+lh2aA8xHBfv+guH83nVGg2PAkVzYgNI8fZpzZ3blV64dKdyJWJDCLWhYQ3DdM6w8OIv4t
	ocFLyUmInoO2mqwnZ61sd3jI3hCiR78fKSnzTBWilPqLG0uz+YXxOtuDab6vLielt0S5XAoSbF4
	CrskV1lobF8veq61pTLDG63xYRvPcugBMcsK9jp4JEVwlH5GrtGV57tplZiQRCveaWM9tksnBRC
	RVWKmY9tAl7CDiBjQ0A5wtE021lD5rrTCKjkcz
X-Received: by 2002:a05:6808:1911:b0:4df:5cd0:89c1 with SMTP id 5614622812f47-57a095040ffmr24374741b6e.23.1795761640358;
        Thu, 26 Nov 2026 22:40:40 -0800 (PST)
X-Received: by 2002:a05:6808:1911:b0:4df:5cd0:89c1 with SMTP id 5614622812f47-57a095040ffmr24374731b6e.23.1795761639984;
        Thu, 26 Nov 2026 22:40:39 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a34252987sm17219283b6e.4.2026.11.26.22.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:40:39 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, konradybcio@kernel.org
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        neil.armstrong@linaro.org, sibi.sankar@oss.qualcomm.com,
        rajendra.nayak@oss.qualcomm.com,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom_q6v5_pas: Release DTB firmware after loading it
Date: Thu, 26 Nov 2026 22:40:25 -0800
Message-Id: <20261127064025.1948456-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-ORIG-GUID: IfVuyng0hdOFEFJ0cCHe4jFjGBFNRZpv
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b0925e9 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=y7k6Y5ZFAmqM3zf5DFcA:9 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfXwbj0wBNPb35e
 iEB0FQz1mIfd+isrqL7+zaCQTlrQEVRrDhUEff/nj70X7Yejd2WgQMfTBcvVdLivwe+ID75bh9X
 v4amdsuttzYlbGpQ9pcvYQS0JGlIYNA=
X-Proofpoint-GUID: IfVuyng0hdOFEFJ0cCHe4jFjGBFNRZpv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNiBTYWx0ZWRfXylrGspV6zMnG
 uh26LlzjaBWcDSai5ASDWjknPVWyAzopOWWgjDPvf3trDqN3zDmzCn5ShZNjVc8kXJY05Tamn0W
 vSj0u6AZYZUjt9EFboYMQVdWg3KWOaNjQmlfVIv82n/i3RD5XVJEP18jhAWHhQ9zxAg0dlMXYxY
 CmODXsCEfglm/gbAs6+IZYNFop5zf+WUA2galt749BTHuYHGgYZRQjWW6LMQv01uSdt8bUfdycN
 jDQu3WoFObfGPMShmdARLAp6cfuUOGjUKVTEJGTGGMB2hKpOhZuzhGv5/dfe4uVUHWFki5EbeuH
 GMo+x4iuJhAPUqzp/47awP+G3Hsns6HgVLt4LYUntTB21Ym7gl3qTvwdmUnmvLn93TsFioNZgG3
 iKS0AcfiuoTXgyEOlejGCMv15Dr/AVMOW2kFRpX1FuqmSAZto7RVmbylM7v0Cg0VOlV2Rc5lyvG
 xcAEaL4w5VG1AaBFaBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270026

qcom_pas_load() requests the DTB firmware and copies it into the
carveout with qcom_mdt_pas_load(), but only releases it when that call
fails. On success the struct firmware reference is never dropped, so
every start or restart of a remoteproc with a DTB co-firmware leaks the
firmware, and the pointer is simply overwritten on the next load.

The image is already in the carveout once qcom_mdt_pas_load() returns
and the metadata is retained in the PAS context, so nothing refers to
the firmware afterwards. Release it right away.

Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ff2483529d73..d5269a57cbed 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -284,6 +284,10 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 			release_firmware(pas->dtb_firmware);
 			return ret;
 		}
+
+		/* The image is in the carveout now, the firmware isn't needed anymore */
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
 	}
 
 	return 0;
-- 
2.34.1

