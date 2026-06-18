Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C38635E926
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 07:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781767005; cv=none; b=cD/hECbcQqASQFy1wPqEI+GH9YGfPyvv6wvrY2zdcqRIJ148T04gcGIx2d1/CgOij+maaak2SaGaYA3ti1VVqfzRwDyEgueuVuIZhGP4fuuUHgMCvtVXBczToJG9dcLvtTKSvAtBvH2cF/VL3KzKOTVqx4Zd9jmKYV5w5FpRkUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781767005; c=relaxed/simple;
	bh=hvOh8cEClaiB2vFMktW+2r7QZW93RLGLCpI2YW05JOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uwB36w6Rmj9CoWTq2CXKU+3fkoclyfxPHE1VJS2Z3spwf8/mXnc8KesZATJJk+Fb0EaenGdJrKacxEvfiQ7ALXOr15Xi2TxmtkMoeBlRlVbJgSc7oas/qdImncVGHtgfaWBBlG8isAgIcKIlPTyua05aOhZvBfYjRFnBdTIlrVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lgfYkfVT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YdnNpzEf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lgfYkfVT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YdnNpzEf"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I6EjSZ3515504
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 07:16:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ShDllGPAIl7Vq+gPkwo0Da
	oUO1L9IDh4ObT/0q4ua4w=; b=lgfYkfVTR0heTr2aKIWDoJLQHU6psB53OEBhMI
	pp/ByugsWlDHzv+AcvVqflykj8FFqTFBraf37zyeoA/3XkkFmJxtCy49uSdWSlyX
	JCeesSWARtvQdyQkHynsd3aDvFYnyoGkjXVi5Q+VkCNIc/RxGKd6Izf5+oLHyrk0
	bceKS5FeBtSj6KfXld45T7yzm8Fitx9nZVX4/TWEz77I9YoQ0zsh/iIMYkHnzCAD
	J9F+WiOj7tgXOCpyMk6xgdFCE5PDgSHwAcE+TCJLifUusvf5pn8TjlIXCxOfK6lR
	agensCWxIZ2/cr606cy6ONTXZshqm8G9HjpJSagk9JEzM7FQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev1wc21f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 07:16:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bef75a41eso2864414eec.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Jun 2026 00:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781767002; x=1782371802; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ShDllGPAIl7Vq+gPkwo0DaoUO1L9IDh4ObT/0q4ua4w=;
        b=YdnNpzEfGHkooTz3bC94odi4E7aAhLooZW/YM4G1dc1CwKNcBu+PhU+OgnHqv13AbJ
         XzAr3PjoDEDwWWWXGhXp+xJYwrNW+2mOE7HRjw+iNGw0hpa7CHpeHP9uPM134sM/fg2E
         G45Ea+v/RurSitYPQ//jzO00YLsDQ6PhGz30iKFahhmkE8rLnAIQW8JvrzzOW+bktZt/
         pX6GB021aBMnqIYDESmTco+Zc3duStMdGMp73qF7ucmtxrTQLzNX1SWNpTYTRlrdCGDQ
         nM3wfqV3T0zygNM76Ii38Mck/hPRu6u69c1IeKevyGxpkd9cdhDZfaR6dcueMxrsgVyZ
         Q1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781767002; x=1782371802;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShDllGPAIl7Vq+gPkwo0DaoUO1L9IDh4ObT/0q4ua4w=;
        b=ckrskswXtqj1CkSdtnO2y3zbVWaCoBWgmw1GZTh4OMYlZhLCtuHNN1YvvknL9+8Gr/
         vFSb0ciUjzu3C2gxWbzjqMPGkLfCMyLZXdq9kkJpiEgVmjog5yJQvGsE4fMsaFcKCF0S
         n8On9jTW5eE0p7TiWwQbY+aQKGfQbcjT77VwsYfaCb/lGyGPvV/mzSdFLcTJwwgVE3IL
         ySN/G8cKv772ye1Cap4dKyeLP+mt/56l/KcRGHOxrDF7tRcuXYCeu2umm4B9EPI1vmxM
         ihMiokDDJrKm5y3/hQqWLqWm1OE3t7Q6o/GmqMbmy8JdFLdmH0lq3Q8N7uDp/fclgL4O
         c3kg==
X-Forwarded-Encrypted: i=1; AFNElJ/l6XT97Nnjhp5DkQIIGA/JnTYg2xXCa72Wb0PEs+dWrQAY6Te0ChMg8FxQPFk7hsBB9o1T+oxS00vsKx6R5w2j@vger.kernel.org
X-Gm-Message-State: AOJu0YwAOdaVSbLCBgBWoJh16SWXkuo4XF7WU36UAjiizxRLJ6s8AtnP
	rlZC1DzRSUR9uqBvKoKNLsPm3noE86gavl4yFBhx69bAeByOiOyni1G+8OK+v+o4W6GCErYrDLD
	XgxMwr5zHyjz5oefg9tB/Sg3gqO8LKRuYYSDSvonj5Gxx3xmDNYtGm3lBgk08NOU/dcHf9sVr
X-Gm-Gg: AfdE7cmLj7tQssvKPb5rjXi8DfMVbrF0167uA9OBwq9AarF9ISxgGCaQEb/naQOSoB+
	D+6a+HvEY1Ym06DPehxONFt5xHCEAzHe19KPzEe+2G5JXGs+xNogsYoBVdUIq8ADSrPbjgteETI
	o728/F3YeorIuD6JE6YhdmXokpP2j3vusy6Xjf5bYRPAc4eSbJ7j1/gt6C9cH612CeeIAuWBzRb
	Olj7F3fXxOaOjPYVfhsiPwyg+pFFcmZ9q4oFpucYK0gdX1/K54/sPk11Ll8fkQvLvWr5ntfzOWY
	5ZAosCeQdx2WLmFcDjaj6m3RA/vD9dIiPF5C5Au4sFq1JpEk5lnGd4r7xT4wBUpjf/EEsZbcSfi
	UzZvH3Ev4fz8B8XJWF9w6xqBNZRCK/emfOpiO4uHJIsxU9n/wjK65UMLB/jua9FFg3A==
X-Received: by 2002:a05:7300:2302:b0:30b:c502:23df with SMTP id 5a478bee46e88-30bf7175348mr885303eec.13.1781767002299;
        Thu, 18 Jun 2026 00:16:42 -0700 (PDT)
X-Received: by 2002:a05:7300:2302:b0:30b:c502:23df with SMTP id 5a478bee46e88-30bf7175348mr885280eec.13.1781767001800;
        Thu, 18 Jun 2026 00:16:41 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30bd677ff31sm4089851eec.16.2026.06.18.00.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 00:16:41 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 00:16:39 -0700
Subject: [PATCH] rpmsg: glink: smem: order FIFO read after availability
 check
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-rpmsg-glink-smem-mb-v1-1-68a026453a69@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFabM2oC/32NzQqDMBCEX0X23BVj8Iee+h7Fg8aNpjXGZlVax
 HdvtPdeBj6YmW8DJm+I4Rpt4Gk1bNwYQFwiUH09doSmDQxpkuZJLhL0k+UOu8GMT2RLFm2Dssl
 lq9KilFkJYTl50uZ9vt6rH/PSPEjNx9XR6A3Pzn9O7SqO3n/DKlBgrQulMy0ySXRzzPFrqQflr
 I1DQLXv+xcvMPNuzwAAAA==
X-Change-ID: 20260610-rpmsg-glink-smem-mb-3b63dc278358
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Arun Kumar Neelakantam <quic_aneela@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, chris.lew@oss.qualcomm.com,
        stable@vger.kernel.org, Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781767001; l=1751;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=hvOh8cEClaiB2vFMktW+2r7QZW93RLGLCpI2YW05JOI=;
 b=CyC1+P4gLTNiG0GCQOxfrjRtgg6Ue4lxkOwxEGVYWbQRpaeYKJeG0NZaWGjaFEp05XZKrfcTw
 0rL0I8FJEITCUulKK2OTq8Ts6a7ADjaL3m7LvZpJ59vuXNmKKYfr8Rz
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Authority-Analysis: v=2.4 cv=TMt1jVla c=1 sm=1 tr=0 ts=6a339b5b cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cA7Ack57fQK9oI2lPcoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 2TyWgOC5xNuYUs5Ue5YbCiJwc9njNQtp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA2NSBTYWx0ZWRfX1NVX1qURBYql
 qvda1nYgevSOHPDWsg2ieXtp7T8r/WYNTwDFDVcjuw0GlqysgFLxwRkAPAkTl1bQImZo6zzPozc
 gHc9cLSFmZhpwzDjs2AGWNFTaJoO4es=
X-Proofpoint-ORIG-GUID: 2TyWgOC5xNuYUs5Ue5YbCiJwc9njNQtp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA2NSBTYWx0ZWRfX/dEKQe0/Nhpx
 BRTAqN77DICeWlfQQrdY5B+D5OvdoA/5LyohxqXBxEU+gWVHRXrFnad2wdigl44nEEEpeGFKaU6
 ws6AnNZtkwEs1DpD84D9oM7bHJ/Tw7qhRp6aOOxXpt5W04Sg3mWAX2eNj3OQntZoMxxD2TEKDQ2
 MDexx5Vl1ykvSwEAbnL4d/RyBk2NROb/jFbVBkUK1DcE4NZHnx3J9XbH3HXR6ll5LEusnFiPZh5
 AB/2kSKadhFgOJJiiS9kHY9LDehNJCYHnreG6esHQro8SVWUeoJJeb6J+LPrCEbOk5hHVsxb+OX
 qRuLK2rV7EpojnLwMaGqLumn9YUnnUQKgWc52JdJoofMzrK1GHJ/3W8dCWfWhEsXxOTKgGp00H2
 Pn/rJ5gdwWX4SY1pCnRKJabF/3izoSFfaKyhrpUW0Pvcx0SNlDHdI0bCD08Sj1lshM0OGD+qFIV
 rj1qKVtzFAXitwZDyWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180065

glink_smem_rx_peek() reads the RX FIFO payload after the caller has
determined data is available via glink_smem_rx_avail(), which reads the
remote-updated head index. A control dependency between the head read
and the subsequent payload read does not order the two loads, so the
CPU may speculatively read the FIFO before observing the head update
and consume stale data the remote has not yet published.

Add rmb() in glink_smem_rx_peek() before the memcpy_fromio() so the
availability (head) read is ordered ahead of the FIFO payload read,
matching the consumer pattern in
Documentation/core-api/circular-buffers.rst.

Fixes: caf989c350e8 ("rpmsg: glink: Introduce glink smem based transport")
Cc: stable@vger.kernel.org
Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
---
 drivers/rpmsg/qcom_glink_smem.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_smem.c b/drivers/rpmsg/qcom_glink_smem.c
index 62adc4db2317..35bb03e67ae8 100644
--- a/drivers/rpmsg/qcom_glink_smem.c
+++ b/drivers/rpmsg/qcom_glink_smem.c
@@ -103,6 +103,13 @@ static void glink_smem_rx_peek(struct qcom_glink_pipe *np,
 	if (tail >= pipe->native.length)
 		tail -= pipe->native.length;
 
+	/*
+	 * Order the availability (head) read in glink_smem_rx_avail()
+	 * against the FIFO payload read below, so APPS never consumes
+	 * stale data the remote has not yet published.
+	 */
+	rmb();
+
 	len = min_t(size_t, count, pipe->native.length - tail);
 	if (len)
 		memcpy_fromio(data, pipe->fifo + tail, len);

---
base-commit: a225caacc36546a09586e3ece36c0313146e7da9
change-id: 20260610-rpmsg-glink-smem-mb-3b63dc278358

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>

