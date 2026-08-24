Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F693E49D7
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 07:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787555163; cv=none; b=APEtJsxjMxsPIOOonL/EL72EhWm9YEm7LMWNGG6BAjiQZIFn+ABvxxnKaudTYyE3+13ryOvv+OXVMhv4Vf5zPnFDnm7CD/bxZwxM0yNUWtJStoSPq4Fj+HfKPXGa2Ag7JM9yEleI7sJqD36m9/FVr1W8fh6B7BA6I9deVJ/dd6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787555163; c=relaxed/simple;
	bh=rsrLJ8U4ENj2NwP7dIsC92cQb9GWiEQilwgM3BVYY7s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iYlmXEy7jVErgKP5CTd/DOs1BkN8sHB5BeJqN7dBAsFmSziWnxUTHzPjhLP3u0mOwQBoW1j6+Jz8Y4muo5Gm8xrv0mJ3UKVKpQBU59NxL31X1YQKCi+p4nMjeUOonTpdubK++VlPSU0w4u1QqaXSUC+4U4sw9TPoBD/+Mboh0GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E83YXJD2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJGwcAGr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E83YXJD2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJGwcAGr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5QxCq2041216
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 07:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LWUptU+3+1yqjWwnn1UpgN
	xq+vQcwQvffdiDdqR5MfE=; b=E83YXJD2RFLyiFDaofvcB8b2L+Wt+P6bfWy08W
	y79+NuZhCE4Md+2n1IJIHV7sI/FvQuKv7s0zIg81iS8y/+kFwffO9KKgiOCa+TvM
	pq8f6YU+5rkkk4rhe0nSys5X7HGPYMtqIf6tMuyoOK38zDDU/EVKSrnPSDVMSNaC
	/MODPrbE3wMgAJBhIYDJuz+JBveB6yDlQxQcsiVV0jHMwPj0Sno6sb2S73n4p8sO
	yILAwNpL/RIvPAOTi3rIdEBiDKtWZ96X07Mv5g2aw4seUSmOrWbe8BeCHlm9vVYQ
	nekYXrCSyqQe56tdCz/3feEmwPtJdiIawFC5EehHIuffmXMQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7hbac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 07:06:00 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e375d9736so2597584b3a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 00:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787555160; x=1788159960; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LWUptU+3+1yqjWwnn1UpgNxq+vQcwQvffdiDdqR5MfE=;
        b=bJGwcAGrAa6na20T0DHe1HHbndwndqrLgJPDRHXkC2a/ko0R0qXGSlIwOhPqeRgNQk
         ZzkDNesiDZVbazEReSXJ5vAp/WbkuI9Cg4uyKwqM28r3NJk6dwV2pA69tm1WfrNTRogN
         LINJIeOK6rBmTOb+dCFAcdT2dKFSA4SnNuTSSGWXlNXpqHTyiZNjakChZDJL0biEh8k7
         W7JwuoxEn1/baE9PzmR3klCci5rYGK+TiqkseTAyORHmpz2Vt9gZWJEDTHp/z/k11M1P
         fflQ0CdW/VB1pQNbTiV5gc88tqJ3TjpMLHa+TypmyhwAlfG1mJnswut2Fk2oG0vzf0ne
         k5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787555160; x=1788159960;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LWUptU+3+1yqjWwnn1UpgNxq+vQcwQvffdiDdqR5MfE=;
        b=XDg9zORlIPuKwrjrZeMA6lUiuqpqjDmAUiLHLxOFwI6uk5oYih5rOoreGVDawdkJzr
         H/eRa2gn1frK5CkMhzh4Jhnibw1phLQH3DMVuWnNMXgNyTv757/W/fGhDBqDreylj0WF
         Ae5NMGKYdkIECjAijBCpem/vZ/AZmgE2wO5tzj8+dBmfHPMrmYGesDAA47IDF5caFyZa
         VTVDlOlfZXEJ+mKdghesC/UQT7ZcRQw9nu7MABDtZaiMy86fLOLqbq/+4m3T9aPJkHJu
         k36AvXZTWIGo5lbCMWgpSJcxUlW95eBr84yl2qY5GxnSdeNUD0HbbMPP3xZFcs3fWIj1
         kGrQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcwBaGtFfxV6/meRoNhKx8AXZUD40FfDCNMRm/s2ZSC1IwXVcZsEYLOh0yTLJTha09XdIpuv8v2NEMctEFRER4@vger.kernel.org
X-Gm-Message-State: AFuF++lAhcOuts1xdyI5Kq6qtUcoWHzddSs/hzA2tFEUTIEnIx2XOxFy
	KDVzF3daa32dfRW/wPoCQYK1lFpR8wUyBRe9Ex+nLf9MpugRozWEqzfs8PI9Bw0PmOM6MNIbOTs
	ewHhfMvyAJnLDnhA3cJGabEecitTlLWqjnyxy5t4+jCpIwjMGI/3NHZhW9A8BfbhXDwweWt0z
X-Gm-Gg: AR+sD12UKS20YtplltSGPCQZ5Zh+4NSs8LWCf/42Mhzt3cjYOJNXkstcIQktIzRe4DP
	3LjTHIdlPSP9HkNc0qga9CdIk0DXJ9uoST0ljr5o/DonrB1wsEZy34zmYCtpUdohf7MoctWtBjb
	CvVqeXOzOzrlbgt47Xr5DtsqLOjMwg+/WP0bAa7GuahopkB6v/zqDlcG10EefvyDKTkL7HHqkcU
	vNNho+Sk0gwKdJBv4v9mKs7jTLwCu9FWxKbfE33kdo6ZcS8HFW9SQbSbqcgBR0yBqFjRYwpMMul
	SoRaqXgu8HzSpAWRriDsGRqQ/YZvnDEO+phXVkUyKe9XAx/exFR5IF4FGK47bT9sPOHDm+LQnoB
	RbnoVrdHJLNXfzH+qZwbstItTtU2Goq29xne8R+Q7NgmpqqLregxnvnU=
X-Received: by 2002:a05:6a00:2ea1:b0:84c:5b65:ef86 with SMTP id d2e1a72fcca58-851fa060bf6mr36033950b3a.17.1787555159719;
        Mon, 24 Aug 2026 00:05:59 -0700 (PDT)
X-Received: by 2002:a05:6a00:2ea1:b0:84c:5b65:ef86 with SMTP id d2e1a72fcca58-851fa060bf6mr36033879b3a.17.1787555159318;
        Mon, 24 Aug 2026 00:05:59 -0700 (PDT)
Received: from hu-chunkaid-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f149ef3sm1642178b3a.41.2026.08.24.00.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:05:58 -0700 (PDT)
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Subject: [PATCH v2 0/2] rpmsg: glink: Fix version handshake race against a
 late RX interrupt
Date: Mon, 24 Aug 2026 00:05:52 -0700
Message-Id: <20260824-rpmsg-glink-split-protocol-start-v2-0-362d7c233f66@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFDti2oC/42OyQ6CMBRFf4V07SMMZagr/8OwoANQBYp9hWgI/
 y5DXLnQzUtOcnPOmwkqqxWSszcTqyaN2vQrRCePiKbsawVarkyiIEqDNKBghw5rqFvd3wGHVjs
 YrHFGmBbQldZBLKuMSi4TwShZNYNVlX7uiWtxMI78poTbvNui0eiMfe0/TOG2++Ty37kphBCCL
 GGVUpyXjF8Mov8Yy1aYrvPXsyUOX/ivT9CKxSxPheT021csy/IG+UApaTkBAAA=
X-Change-ID: 20260604-rpmsg-glink-split-protocol-start-3df74dbd5c94
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com, tao.zhang1@oss.qualcomm.com,
        peter.chen@oss.qualcomm.com,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787555157; l=1580;
 i=chunkai.deng@oss.qualcomm.com; s=20260604; h=from:subject:message-id;
 bh=rsrLJ8U4ENj2NwP7dIsC92cQb9GWiEQilwgM3BVYY7s=;
 b=uCERt6TTozohUDjCQAyT0xQSAPWh4m6Sn+W8nbkWGyiHF9w9Qo34qeKnkzMeaBEs3PCeZejC2
 U+ieIv3/sucB2x6fY9/TpnYaUnYYtAulkxnigtj1WR5tATStSr1wVlr
X-Developer-Key: i=chunkai.deng@oss.qualcomm.com; a=ed25519;
 pk=wWxCpsJRKQeVRzpZ8GLRnUX6ozLMowqE3hiz/j+j9O8=
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8bed59 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=cGRP0HO9ATsEQjh_m_AA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2MCBTYWx0ZWRfX0rAsFCCmNZQp
 OzPujQCt6VvfRLLNhgCo/ymwWKSS2LQpF2KrPHbu+nghqAloBuH7BVYEgXio7YNBMwFaE5npFmc
 7B5JMXDeTRvE1jcYtnqQI4sORxX3Z8I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2MCBTYWx0ZWRfXwtXUmRJNH9NW
 MjkfuU1KS5Ez5aFxutOJHC+MUsBZMEnDCq3+/y0oELwpGhdeiXUYX7UrMw4RZ2I2AWo4fGxVRjR
 p3yWaZg9pT6759JIQeqDfWznJcpiXX8Bj7pP5Zfj21/b4ESuQiBNXpZftRIrkBIeUtTQKlsfjPI
 1DD4D4WxvgfOiT/WLlN2emeyyuScHN+lQUcQG/cYKPCY5Au5vR6b8pS9Llc9RMZOM01jmSf0nug
 yiOw+BDGZPXy4rXTdIQzS0WyxfK31cghUWLlSaB4SPTEDPldfNPmrFKGfQkmuYoqgIlgOXps74A
 zXQBI6lR6ABi6Mzlruf1+6/6FrhhfffqeJoRpGs8Nd+HavllB9iyljY4T/rAo92VDOzdJMbn4v1
 TZhzze2AUlG9pGlE6eBcQdZWTAqwXleK7ZIR9yCbJ4+arOktQhKKifrmo65BS8sWEUB+mdcqq5M
 WD2YQO/SyFSq5n5X1ZQ==
X-Proofpoint-ORIG-GUID: OIyaO5mpQsIcxUZCqaHAXQqHy4UndBY2
X-Proofpoint-GUID: OIyaO5mpQsIcxUZCqaHAXQqHy4UndBY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240060

The glink transports enable their receive interrupt only after
qcom_glink_native_probe() has returned, while the version command is sent
from within native_probe(). A remote that answers quickly can have its
version ACK dropped, and the handshake never completes.

Patch 1 moves the version command out into a new
qcom_glink_native_start(), which the transports call once their interrupt
is live. Patch 2 drops IRQF_NO_AUTOEN, which is no longer needed once the
ordering is explicit.

---
Changes in v2:
- Drop IRQF_NO_AUTOEN in a second patch, as Konrad suggested on v1.
- Keep a failing chrdev registration non-fatal in native_start() and note
  it in the kernel-doc; v1 turned it into a probe failure by mistake.
- Add Assisted-by tags per Documentation/process/coding-assistants.rst.
- Link to v1: https://patch.msgid.link/20260618-rpmsg-glink-split-protocol-start-v1-1-c4f93986cdb4@oss.qualcomm.com

---
Chunkai Deng (2):
      rpmsg: glink: Split protocol start out of native_probe
      rpmsg: glink: Request the RX interrupt already enabled

 drivers/rpmsg/qcom_glink_native.c | 32 ++++++++++++++++++++++++++++----
 drivers/rpmsg/qcom_glink_native.h |  1 +
 drivers/rpmsg/qcom_glink_rpm.c    | 30 ++++++++++++++++++++----------
 drivers/rpmsg/qcom_glink_smem.c   | 27 +++++++++++++++++----------
 4 files changed, 66 insertions(+), 24 deletions(-)
---
base-commit: a225caacc36546a09586e3ece36c0313146e7da9
change-id: 20260604-rpmsg-glink-split-protocol-start-3df74dbd5c94

Best regards,
--  
Chunkai Deng <chunkai.deng@oss.qualcomm.com>

