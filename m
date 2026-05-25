Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4562E2C027E
	for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2026 04:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779683463; cv=none; b=m12DIBwBryAqMORFb6CDZy4Qiirmzy3GdixOLeM2pnff1UylWLWDIFFrVn2VUjJBq7y6Bl+ue44RnPD/9CqDDeUFhdgJUDW7yCi+JfXq/ifRf9Bwn4JdocQQ+zX4qGw1cqZEOt355tr4cgrHVKijnwjIgYVHY7i+TMRIfOBzaf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779683463; c=relaxed/simple;
	bh=M1gGZpcyb3m6+igNJ5Wnv/Ed5IcDZBWwh68gCIMAliQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWaPBmmmn/Hig5K9syl+ZGDZM76bpvIU27PMpBElJglf1L62NWIt1WWsmd3/USIMONZJSX5XSALRvIH77u3ySdU5wYi5djCITmfHRy/bdgcJBCzvmaDWC08WBBkyVoyrtH3wYy/MPR1SrSW8PqL9SN61gXJ9VRK+wPRsEVioHM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AT9Elm2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AXd86NO2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AT9Elm2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AXd86NO2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OLkgIp1671213
	for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2026 04:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mxjdMdjm8PaT+eqqOGCHzcPe
	adgwQpwbfRtAgKRaHOw=; b=AT9Elm2r7QCXC13qx08/tQKxThiLLXAHD1t218/K
	FF4fA0BdZjNMhD4LNz2+x2WsqykZna9hu1z9kjagUIDs+Ayv8pxjmkYMnT/o4yba
	isFwYIuDRqrYU+vuac5+NCgYUWPBxjAq9Pwd/k+WyPV9edzmWIwIhoAjL55KZPOZ
	JMHtR7aFFnoA0Jd21TU1/t3oGE0D9rdEJbtSfp3rcr+CneotrRXGQaqtE3hK9uk9
	vUde1btzxtQjqjZfCRGVkpj8jxxCPkEOs/dR2rRSCLpOobgi4w6EEp/4LlgLUoGE
	yG7M/ntQxh+mv1VWuGPykqJVSudP6OZUYloZcfTk8AmjIg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4asvw6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 25 May 2026 04:31:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f5943ca81aso2238006eec.0
        for <linux-remoteproc@vger.kernel.org>; Sun, 24 May 2026 21:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779683460; x=1780288260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mxjdMdjm8PaT+eqqOGCHzcPeadgwQpwbfRtAgKRaHOw=;
        b=AXd86NO2biX46SvFyChy4Klxz4KCdpUGu+qgtJFwm/LdfzH2lB2Ul1N9NC1I7D6n5c
         1oLtTQ9TKjLDaYiV84n8pJST280EA2z0cTKkRS2SLs+GQ5QZ094uAB6wOkMnj4JL8m0o
         Zt7I8LSFbHQ7mTvwMG079czii0G3KJyecOzRnuYC1tnPuha1BaqVmS39oN7jdAlNWKl0
         uw5jTeMUWjmp6AJGUsGPbLx9VntFGF9UcBhIKNZrcq4R7cdif55mo2esL/8K/5yitqlG
         VDYWn9d4F2bxlePCY3n0tJa4NE6AUZQb1tu7S5/BMmTrEcbn7TGdmXE3y3U29N8Z5GVz
         0X+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779683460; x=1780288260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mxjdMdjm8PaT+eqqOGCHzcPeadgwQpwbfRtAgKRaHOw=;
        b=ei5Hrzrn1ZYv2Y0uGQ5RVwbL5TBoaiwvNcom9x/LjqQkHuKxxv3b9+xW+NeL+yjh/h
         GONoZQPIPBWh1A0EeT0QIDuOieALHRT38chOcRdmmKANKSCvxkfYJgnaH3Gf89ik5v8G
         D0xkZRHWQUOuzKWlVW4w/WgZTul3UpiNl6YD9YpwzJUhSCUAYkLiuifxLgNhadAJyJEk
         +/7GSMEaQ70IYEU34QfmQdj8NtAiicggB6dl5IW8b9MEWnfUnn8R/qqaB3stVk3mDLGF
         n9iairYDdYb747/nMOxTZ/xciBAYYR0OTdk2549UToPYSRrY8OWq/9LUWfyNUBakZ8RC
         LosA==
X-Forwarded-Encrypted: i=1; AFNElJ+X0xvTR6vjcniml99v6KwaGCob5QFgI2y04yaSUteKZ8GoxdLukLtFVOhRqtxXWvCj66tWRXutYOQ0q+qG67P1@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoa9MdoS5OVHVJyyR2fSk1xScVLhi6yapyyhR0gDcYmivLivWc
	RZHy2Lg8n7eEtwPHEjN8SZQ13s6Wd8XZmrCsxW9bcCryLvBo9EdGeq6MAtq7OPWzef0iU++zPVA
	9ISt0U/SqgHu2QAyHzaeO17iyikH9rSs0IP4EhpCEKiwCrG1Np8kZXU9l2bC3EdYBqjBS4IEs
X-Gm-Gg: Acq92OG3ovXql8eJ7y6HBESPLVLzDCoTexGV6Z5gXON77oBzpK/yY4ewWw0sAKDuWJa
	Es+1s2WwrmYg64/eCEg9mLy5lY8oJXDxQ/9baKBhZF5vG1yuxKq0MP7JNg4R1I32VgX/iTX1zOZ
	QdVqhsr0+P2RodHuXXMUR+bWJc8HzThNAnCTJ1EBZdoWDalPni2dtW3ntPjs689lI9GVkC7drLV
	wJQQUoI04FLmG4OFNcUMLI06MX2KDYDex7HKgNP3Qaa8Udd1XQWPSK1NCGhJeXlXXMln7kDj2du
	TYJ20mR/cdJyjpz5TIe/tds2qOgiAbszl/jJgvRkkpKt3IUjIfuccLmbYuPpC94/LitiQAO6rbA
	3sBUWejjZzga3zOEJ7ta2DVD+gpb8P1mibmcRbv87A/Y98VO8cjC6kymraX5ODvqX
X-Received: by 2002:a05:7300:ef83:b0:2ed:e17:d510 with SMTP id 5a478bee46e88-304492015bamr6255506eec.35.1779683459671;
        Sun, 24 May 2026 21:30:59 -0700 (PDT)
X-Received: by 2002:a05:7300:ef83:b0:2ed:e17:d510 with SMTP id 5a478bee46e88-304492015bamr6255489eec.35.1779683459061;
        Sun, 24 May 2026 21:30:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30481ad4cd3sm2532345eec.27.2026.05.24.21.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 21:30:58 -0700 (PDT)
Date: Mon, 25 May 2026 12:30:51 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v6 5/6] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <ahPQe8cUihXa_lVD@QCOM-aGQu4IUr3Y>
References: <20260519-knp-soccp-v6-0-cf5d0e194b5f@oss.qualcomm.com>
 <20260519-knp-soccp-v6-5-cf5d0e194b5f@oss.qualcomm.com>
 <ahBG6jKYdSAboWjs@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahBG6jKYdSAboWjs@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA0MCBTYWx0ZWRfXzoyNPhgB5m/q
 cppKgisLwQGH9qei6pAfYAD6egEuL19vQVX5nUpOXTo26OLfzDFTDAJdmgZQ7DtsNG+jS3q0ERr
 mqy+egbSikzgtr2AH/9DcmQXpGuziEAqt1ZsrrMedK173MWUClXT47zz79Y1oQsaQrOcFdNJvWb
 LKSWi8H/9qcMugzt1XxJsn05nDYL18ka1iua1OQDIG4YndcRppBXGaBsd0+rVV+58sOvR8nRsb5
 RBcNa3wbFlPgjiGjGyTvAv0E9OkHnJ9R6BY797IVFg1EnaKTG8X3ge+kyBY7ToA6BTsvwA7Ghpy
 c1KqjyQS9KE/k/uSReQzyQJ0stvNBD3xj8Uvqn9lyZGTqWVNpapsal9uXlqd9ubkwS/XgxQsKH4
 XmmWgbRJfSNI2dMwcuJEtDBuaXV7ayjJHuLFLeH38q+wUc/fiY6mv7WOukpPdWH22naw+3A/Hqu
 ppW8D6pU3C9QyzoP8aA==
X-Proofpoint-ORIG-GUID: Quz7aZXBz0a_j2v06JcIzcwmz3zhVzTQ
X-Proofpoint-GUID: Quz7aZXBz0a_j2v06JcIzcwmz3zhVzTQ
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a13d085 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=NTgEU9xG2j4T_9ohbxkA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250040

Hi Stephan,

Thank you for your great input!

On Fri, May 22, 2026 at 02:07:06PM +0200, Stephan Gerhold wrote:
> On Tue, May 19, 2026 at 12:24:23AM -0700, Jingyi Wang wrote:
> > Subsystems can be brought out of reset by entities such as bootloaders.
> > As the irq enablement could be later than subsystem bring up, the state
> > of subsystem should be checked by reading SMP2P bits.
> > 
> > A new qcom_pas_attach() function is introduced. if a crash state is
> > detected for the subsystem, rproc_report_crash() is called. If the ready
> > state is detected, it will be marked as "attached", otherwise it could
> > be the early boot feature is not supported by other entities. In this
> > case, the state will be marked as RPROC_OFFLINE so that the PAS driver
> > can load the firmware and start the remoteproc.
> > 
> > Co-developed-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> > Signed-off-by: Gokul Krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> > Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> Unfortunately, removing the ping-pong functionality that was present in
> previous patch versions makes the whole mechanism a lot more fragile.

We are not discarding ping-pong functionality but would like to support
it as a second step, because it's not supported by all remote processors
these days, e.g. Nord ADSPs are brought out of reset by XBL but it doesn't
support pong.

> I'm not entirely sure if this has changed in SMP2P v2 or more recent
> firmware versions, but in my experience the SMP2P "ready" bit does not
> tell you if the remoteproc is actually running. The problem is that the
> "ready" bit is asserted by the remoteproc when the firmware is ready,
> but it is not cleared when you shutdown or forcibly stop the remoteproc.
> 
> If this is still the case, you can easily reproduce that with the
> following test:
> 
>  1. Start the system as usual and let it attach the remoteproc
>  2. Manually stop the remoteproc in sysfs (echo stop > state)
>  3. modprobe -r qcom_q6v5_pas
>  4. modprobe qcom_q6v5_pas
>  5. If the "ready" bit is still set, the driver will try attaching the
>     remoteproc, but it's actually not running. No recovery will happen.

Indeed! I can reproduce the buggy state with Nord ADSP.

> In this situation, it is very difficult to detect the correct remoteproc
> state without relying on an additional query mechanism like the
> ping-pong feature.
> 
> You can make it a bit more reliable if you also check the status of the
> "stop-ack" bit. This would tell you if the remoteproc was cleanly
> stopped with the SMP2P "stop" mechanism. However, that will typically
> still not fix the case above since nowadays remoteprocs are typically
> stopped via the QMI qcom_sysmon and the "stop-ack" is not set in that
> case. I believe this might set the separate "shutdown-ack" bit though
> that is described for some SoCs, I never finished testing that.

You are right! Per my testing on Nord ADSP, stop-ack is not set in any
way, but shutdown-ack is set via sysmon with ssctl_request_shutdown()
call. So a check on shutdown-ack during probe would be helpful for remote
processors like Nord ADSP.

> And even if you check both "stop-ack" and "shutdown-ack", that doesn't
> tell you if the remoteproc was forcibly killed using
> qcom_scm_pas_shutdown() without gracefully stopping it first. The ideal
> solution would be querying the PAS API to tell us if the remoteproc is
> actively running, but the last time I checked I was unfortunately not
> able to find a documented call that would tell us that.

I agree with you!

Thanks,
Shawn
