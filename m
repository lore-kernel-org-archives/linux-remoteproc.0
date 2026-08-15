Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F0441BA63
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800361; cv=none; b=RFkiguBFWSFmqsXSqxR9kEUvldtUO0A8OeecBk/5F8Z1hMRHCdBDCzdD/fOYCX5C1BW+1HEKdnBDwb7iv8luJYZktF2Eq4wcyHVe6uHZ/mLZ6jUBNQ3KCIUqSOQAJyaZEVu2Yzt2JYF6b5E5EoA+JAWrthgAvxqFwbBxNO+7oGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800361; c=relaxed/simple;
	bh=3GznvKQYOhzSKPXdcqHPxtsLzm97LoEPV6uvmbuw/Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rY9g+LIAb/Idx+QBjV+FLcLJwXfIwGUE67ydHrb79gwPtIcscb7UUyGBvMCclH+NJMJOoVcI3xPP2vGO+mmYspU8aQBrg6HIErHx9PAQaYLLWLnEXpHNdPQfETGMfZh6L85/VJari6fGRwDf9zhXDaWdniMkw33of8Wr2FY6pCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCYVLGvU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFYdtmr/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCYVLGvU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFYdtmr/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67FDNB0Q281016
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jUpVNSst2CU
	IlrfPT6QW+pK70blfmc9k+1OenQhK2Bc=; b=oCYVLGvUdy6xqJRGZVEulv3wAiQ
	khnG5hCIaocCDtMPe+xVfCu0S0RdOCOhU3aFs7+9g7dhsGrp+hx8NJaYEScfSooA
	/rndfiPYjLZHG19NdStQ+sHg+ZL+G70BCcjk9fYa5hWd7GSJnFSKN1td39a0GvUA
	5a1Via9FNsqE3s30gzx2yb67pV3xIsbV3ou9ptfkwJVOiH4OagonhnDpQyE82vde
	5Q0jcH7HONfb+bsoVkGz47aUihgkHupOIW0rqtVwQzsUqucUS1CHKUZAu7SUuVjg
	6b5cz+llabhwQniwjhqQ1a2UpmXsT9bqSSUCjix74WMMvL+Eo37+iMJzVUw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2gvcgxhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 13:25:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so2940968a91.1
        for <linux-remoteproc@vger.kernel.org>; Sat, 15 Aug 2026 06:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786800358; x=1787405158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUpVNSst2CUIlrfPT6QW+pK70blfmc9k+1OenQhK2Bc=;
        b=hFYdtmr/0Qt7qt1IRSeVwrRZM9cuvRY9sMURCR3iuBistyMImDzbps1S1l8sdx4gDs
         kqDCS7NFDOgMQsSspcnsdEmiJwTwe6b/v4Ur07wTa4Ddezn8D0vGBz+9hIqFJ0iYL24H
         3umoioXMcncbrI604PpVABFBoU2VCbBOxu5EHv27guG0piIMCjhsgBjS9JwT9SKsHXa0
         IDhrSPdZ8CDMG2HlHjNsFc13J4uC4SYaLAUHLChQdwAUYtqlhECe4SHrsW9xSEcfm+gd
         6vx4mATyCgpMzcwFVMEwAqKbwhgJbn+lqX2+AgCt29UDVzur3HE3Meb3gQyaQLENS+eY
         SIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800358; x=1787405158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUpVNSst2CUIlrfPT6QW+pK70blfmc9k+1OenQhK2Bc=;
        b=WuyMtxKEC4YuCxBtixcUavfnhKoV0iR/iqPpravO4TfyLRYWy43LYhtrgktp6nD6zf
         qUGScciXWERqiLkLtD/HflwSdYvki3AfGTR6gACnA6+nkFqt59US0F4y8fSl0MX4lnc2
         kuzWQL+MjH/Z2n6GJMsnPIQeL55mokpgtxrobyEC6juzKo9PGgd9j+zkuFk+HnuYddqE
         zkliDgrKydry+ofxJWGRRyYJTrxmoQn/BUjLzm7pQRhUJi7Qpr3CnKrFZVRSOiQjblCU
         ZNrqfOsMN9zuvjeXIP76XlOTT14oPOGXX3yrXrksPqs+BS6r5aqCioGbVx3YUgEr1ely
         zkiw==
X-Forwarded-Encrypted: i=1; AHgh+RoMHqYv5nGluFLfjbWxOuiRaunTKM6zCKczK+HLwBe9ZJMONbnwKq/FOLcfGSlxATG9idTr4judrO2mG6LHdveA@vger.kernel.org
X-Gm-Message-State: AOJu0YzZNzicJzXa+fdecbFegAqQlfRH8kTxmQyrRoPZSIlkA6drSF7l
	pu8chzWS1eJTnaflqfPSuasc0MMI+nlg65wHBrKA7U1CpPJdvdiGqbKNKGTI0B+q+GwQw3CSnNQ
	VlYlw8KPIBf8L4Xn5BHZqrjHFm6u24A1A/atF0IZXiXdx69mcFn/n77bDaB6EucF0UcHHb68b
X-Gm-Gg: AR+sD10KaFZwgroaStUXoQgP8FKv4JA9U2TB3WzFTRWsoQGT2Trv//HCkwAmVkSE/3l
	PSdh0j7cOYIDhXXozJGeLj7sUy1hvi+wr+q70uS7ULX0ctv838FrbnlbYj8PiTa1SNMLjU84j/n
	CFKtWqKmVwRItxs05sJpmLobRCMqHu6PSzuHY0Kn0CnRxmic06Fx5qRWQs+zzQHxJREbQ89DciR
	E5gNvNfkhfDyS1AJgQYacYAGb1R+Msna5QOa5FAfyrIc2Zdk7JOUM5TspLUYxCVySJJYQwSjvqq
	BzGmx36sqIngEqUN9pvllhNnz9AfDLaB5A2jNBiRmKhSxAg5n2g0By34bVnjJdVs4tx89/bZjTA
	vRziGs7SnrphzshMqkl4Q9qMC21llSDJvKTsSr/xRodnnIUSG4OVab3ciXS9d
X-Received: by 2002:a17:90b:288f:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-3931f5f5fffmr17005641a91.18.1786800358307;
        Sat, 15 Aug 2026 06:25:58 -0700 (PDT)
X-Received: by 2002:a17:90b:288f:b0:380:86d8:8162 with SMTP id 98e67ed59e1d1-3931f5f5fffmr17005593a91.18.1786800357774;
        Sat, 15 Aug 2026 06:25:57 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141386a039asm19313374c88.0.2026.08.15.06.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:25:57 -0700 (PDT)
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
Subject: [PATCH 2/8] remoteproc: Add cluster field to struct rproc
Date: Sat, 15 Aug 2026 21:25:35 +0800
Message-ID: <20260815132541.1575121-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
References: <20260815132541.1575121-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX7mEavcfZrxOs
 hB4gUWsjVqq89+Mza90PxfhFY5kYwLGg6pD9Na/WRbgKMcIZxVRb/OmoufG99xWEFPWWJMSczsh
 7z3ihh0lidOjd8J+v2XxJxdbntDyDng=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE1MDA5NiBTYWx0ZWRfX6oGG1tTTdnAx
 q10AbiIZXMwwKuB99OqDTYBwAMOLN+cevhhD1SDu2ELUTLy0l9l7adb3KOV0QwMzKrcwMhId2WW
 kFHZ5k0OBRZpNOnwWYpHVXeGpaugCcE2Y19rMCDffju1v/RhqABPGZALYFRYhlIrObuGxSbtyvI
 cJoxyVs0/1PcHYAFpeQBII0cA9HrrnsYmA18yoJ+DJBcc1n5EvWCCAW/UlSZogRoQF2l/iSgLjJ
 gntK+5iexd8LIIOhVNN6BFclDhfnYVW1hvOr4EIU4malkCX+h9EdSU7x5BqauMc9zlRymp/WXar
 9UEFp51F0w1DN1PUjn056fRZMhm4Sh251rzTBdK+O0cej1l7tvKgcuWyAECDJvYPk/eu+fsINyk
 i4fF2qLZeMXoETlGwZoN4hXNmKkFqFbLOJYbHK8gpHc75GhwQv57TFhR0TONPXUJOGbbgDT3AcL
 cmKWPIPBmqAhWsw3RKg==
X-Authority-Analysis: v=2.4 cv=UfhhjqSN c=1 sm=1 tr=0 ts=6a8068e7 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=wfuvY1oYJVSYwsIiQWQA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 5HX4i3rVsBg0jxv2oHlV2UgLDFa0L5Q_
X-Proofpoint-GUID: 5HX4i3rVsBg0jxv2oHlV2UgLDFa0L5Q_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-15_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608150096

Some Qualcomm SoCs group multiple remote processors into a cluster
(e.g. Nord's ADSP0/1/2, which share HPASS-domain PLLs, AG_NOC, RSCp
and other resources owned by ADSP0). Firmware on these clusters cannot
tolerate the peer-shutdown notifications that qcom_sysmon and
qcom_glink_ssr send between independently started/stopped remote
processors.

Add an opaque cluster identifier to struct rproc so that those
notification paths, which live in different subsystems (remoteproc
and rpmsg), can recognize siblings in the same cluster and suppress
notifications between them, without introducing a module dependency
between the two subsystems.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/linux/remoteproc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index a44368737b39..53e56d53641e 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -254,6 +254,8 @@ enum rproc_features {
  * @cdev: character device of the rproc
  * @cdev_put_on_release: flag to indicate if remoteproc should be shutdown on @char_dev release
  * @features: indicate remoteproc features
+ * @cluster: opaque identifier shared by remoteprocs whose SSR notifications
+ *	     should be coalesced (set by the owning rproc driver), or NULL
  */
 struct rproc {
 	struct list_head node;
@@ -299,6 +301,7 @@ struct rproc {
 	struct cdev cdev;
 	bool cdev_put_on_release;
 	DECLARE_BITMAP(features, RPROC_MAX_FEATURES);
+	void *cluster;
 };
 
 /**
-- 
2.43.0

