Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DFF72BEC22
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755688972; cv=none; b=SIGH05x+Ov+kDfkN3TddGivmVt08lbfftkyyjN39zYGpAVpKPixlfJtq5mv4FJOnAByhuWRzbDDmsqWh+WQ77RpLs0Tf1ceZTQJHS2BqzRCFghtpl/aeJcN273dNxLF9R19fMXkG6WR1jihmt/O6Ib4/3gH5txOKqZWS47rGeGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755688972; c=relaxed/simple;
	bh=VZtTyZqYgCPoBF4RLQ8FP4HETh9OS5HmOoryIXIYzgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAeT8SWIc1HmGTIslHZu15qnFVljNtSiOrg3HVmachQ3MNqzfh9qMyTp7y9QV9TJlqwFEZdEcet+NUy9SlKQOGep/jPmXsm8vVvdITdFTPNLrJ7wl0166Fecie9m6QcWy/F47qkqGj/gPVoQ5d8hNfQPjRMbN3bHv5eaGJt75KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gsZO/7Yq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gsZO/7Yq"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KATSP5004359
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 11:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1teVV9lLZMsgoOx2s0zCWnuedYjSU8VV3kG4L2Ma0Bo=; b=gsZO/7YqY8uH+zua
	rPZNMfYw+JhDuXjtWOCR9yhmHAng40YTnGJOqMaQVWaRl1q22pPWVjrJKzH1/4Z+
	puNkxOoBt81pMggKtQLja15BEX2x6SBunuD6W7eCAHerJdQjqGnjwY8oMLad36TH
	KfMmyPGgFrTgg/v8tPbn/yZGFNM0gNgy8aqtH9k2mk+7BrEUauyLrEd7R+iP39ct
	UvCCyOyc70Sm/WAv0UuQWcPOsUQ5qJNy/9wqGCXRF31QhMzS1o1JjvRRfk4HgxpC
	iCPZrQW5ms9QJHpuwtXC9JR0IVLr07dhDip2ETl2I4meStrqOuuCOnqQ9BCfUg8t
	+iHU5g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52ahg9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 11:22:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445812598bso171047945ad.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 20 Aug 2025 04:22:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755688969; x=1756293769;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1teVV9lLZMsgoOx2s0zCWnuedYjSU8VV3kG4L2Ma0Bo=;
        b=TcFkIIbbhGJ0D2wYCfMXVz2q0wEtwMQFCdbcSo9+Nx1tWUhp4y/Yd6th8A0yGlAVO8
         PR9yoJ5/pKbBnVFGQU9Yh8kzEEBEj+6k/4PfXbgjcRi0Lhg1kqNssCnqLnZVLtfS/Edk
         sdtFiqa7RE+5IHIkR+IrvuwuV1zPd35bJeEbw1SmiTeD4vrE/+xO2FXfF1FJVgudJdJt
         25Yk1k/XiYzt+Mu6BvCXcbKx2sObm5NHcCf2bqrsRqQGGod0WjaGUPwmilvnjjsU7EXW
         BTm66/a4eE+TT47jYVG+8CLwqA5iXK2CsLFICgYT48zyzOShFZTBQ26WpMSHe6dPS5GF
         xb1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkLkB1+JHzcwfrEMr3aeYy0k9xsssTw3RsjQpI6bbDuJxH2pTKBwFJC79/8LmzB3+7ULIN5bK35QUzQkxPs+qW@vger.kernel.org
X-Gm-Message-State: AOJu0YzFTumSXKfhcXt0OGG24V9linpKjdGgwtYKwaUvr9rWrRarQSrW
	O5IioMJd4qo5cnhVLApPWtZqNlbQXFlYosd1LEn91MsF+yS2e2b1m9BaeoSKxvc9LXJG/Iurp/p
	nYFzssfb6DlzM6OpDykQzD3QWNq9elPbsUAfcrMKQACLYbfcMl1ISc4txzf3VeiY+uc+Wa/Kz
X-Gm-Gg: ASbGncv0m69fLhh0fLaEwZGJ3Rn7CBEEIW9n7ZgtM9fJ14fOnBBtxbCOIU04Ixd5GZ6
	SgZZiux7/ONAG5RG8N+e8jlqWw0lmI7m1tDAhPQ0SutV1tqRO52Z5v/QDBewqtu5lPmW5uLjeu9
	KbkNWjrpaUW2mx4ZDBu4+LMB2Nd8snDMAqSBoUBgjt0Tt6Ldxm1bV3lvpYatwYffmxCoWNWbkqx
	3+8+kzghEAq/Qfl9G1aJOkdxsIZkxa6k0e7iIjmHLmxNtZfCyo2TBln1RBmizhiQS14vQDo4UJ9
	6KmoCJoXE67NlnEkHfQf3Qm+gEeARgfLTx6Edg5cgKtwOhlRXPyfjEjxHkuRwkx9UB8=
X-Received: by 2002:a17:902:d547:b0:245:f2c2:650c with SMTP id d9443c01a7336-245f2c270b1mr17097675ad.18.1755688968899;
        Wed, 20 Aug 2025 04:22:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaKEx4GU9sGjm64Ya4mNcH/P2kGCGO4aNdZjLPT8WXV2jTp2OktIMBv/IPAaIoaHGHIyo+2g==
X-Received: by 2002:a17:902:d547:b0:245:f2c2:650c with SMTP id d9443c01a7336-245f2c270b1mr17097535ad.18.1755688968452;
        Wed, 20 Aug 2025 04:22:48 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed35ac08sm24269015ad.42.2025.08.20.04.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 04:22:48 -0700 (PDT)
Date: Wed, 20 Aug 2025 16:52:42 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 00/11] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
Message-ID: <20250820112242.usd4sdd3avxdlcas@hu-mojha-hyd.qualcomm.com>
Mail-Followup-To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <660c2594-9a93-450e-9a2e-17ef6b4c696d@linaro.org>
X-Proofpoint-GUID: qaXjkbwpDUPYZAE8v5gWXpyWP1xhXDTp
X-Proofpoint-ORIG-GUID: qaXjkbwpDUPYZAE8v5gWXpyWP1xhXDTp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4qeWErx7lxhS
 GlvSKp0sEtHzxb5xvGFT81eB6OSgOw+g8dHrAfn7KYJkwUDv/bLb/uhCk6AdkvuAhs84onyn9QV
 rJqMqhUQnU+Pl5BanTDm7uwBNIL12ncI4bQQDx2l95lFOTHi1cx+TdEajlYDhX/gmVCVgix65fG
 fwiVG+t709sMTfuzzD6ZPbtqcCQA/JB4E9hmbIptMNe9Yum357VOBdnWkoO5lIeOwDHlGB6tzYP
 yu026D2YEoG7vM6N3yN4ICoFtp8x6dLI4HaqDIURUX/YR8bSWxtJvEVZOea3lyKWM4yXSs4ajRw
 LOZSbptucfyGL76/0t4qfudj2tJLZlp6Fxa7cI1gsoG0vNDb4vZPBH7M125KyPVJg/zqV/4gW5R
 PzlbJO/1KRrABXqZfmNXE7d4AUBqtQ==
X-Authority-Analysis: v=2.4 cv=XfbQDI55 c=1 sm=1 tr=0 ts=68a5b00a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=OaBmBNw08KxK7u3tEGwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

On Wed, Aug 20, 2025 at 12:03:16PM +0100, Bryan O'Donoghue wrote:
> On 19/08/2025 17:54, Mukesh Ojha wrote:
> > This is a further continuation with a new approach to the topic
> > discussed in [1] regarding the enablement of Secure Peripheral Image
> > Loader support on Qualcomm SoCs when Linux runs at EL2.
> > 
> > A few months ago, we also discussed the challenges at Linaro Connect
> > 2025 [2] related to enabling remoteproc when Linux is running at EL2.
> > 
> > [1]
> > https://lore.kernel.org/lkml/20241004212359.2263502-1-quic_mojha@quicinc.com/
> > 
> > [2]
> > https://resources.linaro.org/en/resource/sF8jXifdb9V1mUefdbfafa
> > 
> > Below, is the summary of the discussion.
> 
> Which tree does this apply to exactly ?
> 
> git-log-graph linux-stable/master
> * c17b750b3ad9f - (tag: v6.17-rc2, linux-stable/master, linux-stable/HEAD)
> Linux 6.17-rc2 (3 days ago)
> *   8d561baae505b - Merge tag 'x86_urgent_for_v6.17_rc2' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip (3 days ago)
> 
> b4 shazam 20250812-qcom-tee-using-tee-ss-without-mem-obj-v7-7-ce7a1a774803@oss.qualcomm.com
> 
> b4 shazam 20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com
> 
> Grabbing thread from lore.kernel.org/all/20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
> Analyzing 18 messages in the thread
> Analyzing 0 code-review messages
> Checking attestation on all messages, may take a moment...
> ---
>   ✓ [PATCH v2 1/11] firmware: qcom_scm: Introduce PAS context initialization
> helper
>   ✓ [PATCH v2 2/11] soc: qcom: mdtloader: Add context aware
> qcom_mdt_pas_load() helper
>   ✓ [PATCH v2 3/11] firmware: qcom_scm: Add a prep version of auth_and_reset
> function
>   ✓ [PATCH v2 4/11] firmware: qcom_scm: Simplify qcom_scm_pas_init_image()
>   ✓ [PATCH v2 5/11] firmware: qcom_scm: Add shmbridge support to
> pas_init/release function
>   ✓ [PATCH v2 6/11] remoteproc: Move resource table data structure to its
> own header
>   ✓ [PATCH v2 7/11] firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to
> get resource table
>   ✓ [PATCH v2 8/11] soc: qcom: mdt_loader: Add helper functions to map and
> unmap resources
>   ✓ [PATCH v2 9/11] remoteproc: pas: Extend parse_fw callback to parse
> resource table
>   ✓ [PATCH v2 10/11] remoteproc: qcom: pas: Enable Secure PAS support with
> IOMMU managed by Linux
>   ✓ [PATCH v2 11/11] media: iris: Enable Secure PAS support with IOMMU
> managed by Linux
>   ---
>   ✓ Signed: DKIM/qualcomm.com (From: mukesh.ojha@oss.qualcomm.com)
> ---
> Total patches: 11
> ---
> Applying: firmware: qcom_scm: Introduce PAS context initialization helper
> Applying: soc: qcom: mdtloader: Add context aware qcom_mdt_pas_load() helper
> Patch failed at 0002 soc: qcom: mdtloader: Add context aware
> qcom_mdt_pas_load() helper
> error: patch failed: drivers/remoteproc/qcom_q6v5_pas.c:235
> error: drivers/remoteproc/qcom_q6v5_pas.c: patch does not apply
> error: patch failed: drivers/soc/qcom/mdt_loader.c:302
> error: drivers/soc/qcom/mdt_loader.c: patch does not apply
> error: patch failed: include/linux/soc/qcom/mdt_loader.h:10
> error: include/linux/soc/qcom/mdt_loader.h: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> hint: When you have resolved this problem, run "git am --continue".
> hint: If you prefer to skip this patch, run "git am --skip" instead.
> hint: To restore the original branch and stop patching, run "git am
> --abort".
> hint: Disable this message with "git config set advice.mergeConflict false"

Very sorry for the error.

Can you try with this next-20250814 tag ?
But yes, forgive me for the minor manual edit I did

https://lore.kernel.org/lkml/20250820111448.tjaz2wld2nxg52aq@hu-mojha-hyd.qualcomm.com/

> 
> ---
> bod

-- 
-Mukesh Ojha
