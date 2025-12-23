Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A7A13777E
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 20:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766520932; cv=none; b=kwV9T4+/TwJHabBMoA+iQwJxe3YQmBOzi53CPwgHsccrZYGANPla0tsb4+A40GU0ul+Wy8rDUzqHgE8oVpuJfVSTw875+WSjfYoPZMEy326WieovlY+tp71mYVAQxa4SLXIJtdCsnqgor6KsR2MA0Jdvz11BVgi7c7m82weJkrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766520932; c=relaxed/simple;
	bh=yJ3KUc5yMU4FrnowAoIsslzzphg5KFjX4PvFRgKH2hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3XTYqeYYofwimuOIoi7DjuJZZMz3tLBZYaSS07WsAA9Tykv3TQclqrF/77S1aeacJT9N4ZpgugZyg4gVJaZ2IY4uODlbAyVKoxmmgmg+4hxvUrK2J1Hd3Y5B+teDt5g5wzLOYUOMWAT3ok+VHse/VriVVSttIba4Xu2vitbng8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MccDaSc3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K8G/11/D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MccDaSc3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K8G/11/D"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBRwvC702677
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 20:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gS4g2eUmeYobmFi6ysaa22ZY
	ByOUMUYywyMHMVMh0Y0=; b=MccDaSc3EXp70G/HeP0TzXFusa7W6oWzSJlK1+XY
	92ppfu2aTXUEsdhJHy7qXSkqWnhkv6uc0cIZcevBiCLATa1CormWOoU8/cM4scoR
	4ZgxzFUezoXVQLneVGbyGuJudQu5lBlUtnCWpCsmREpzD/OjUPQBEzZOJK7uC0nS
	bZp+zOlHmzPMT6tKSfAE0wLzNfFz9dzSnXmKWaYbAH14vCSbx16tr9vAoxJuFZD/
	LDOwtXweXE8Je3GiySB0jF5JFaD4xj6moigiS2rbBzS0FVR/FPFNpletHOFnjcf+
	BNJCyw4faTIspKBk86hrAACKfvzLIwwrOWTCjVJ0a9FvYg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jshms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 20:15:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4a92bf359so114146071cf.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Dec 2025 12:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766520929; x=1767125729; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gS4g2eUmeYobmFi6ysaa22ZYByOUMUYywyMHMVMh0Y0=;
        b=K8G/11/D+hdE4uIEVPoBCMjorhVTnwlpZe/ukLtGl7HVVd++WzXuhTH+ervtsQJpl2
         rF3LMPHxl4KKvAwzrQ9NYZbTmaXMoPXux/kK90N4sfBZ6xa13CZSez0F19mW9/9o+dno
         F7z9HqAXpi1jqMfDRiGp6S07AAoUJKLZBlfaifM4/wWCccQbieA1mDA/3O2Ez4AmY5+o
         0TKOfFdP+e8Aa7CnRdH2daIfw2uaY7DKMf+h3qG5jzmVMlndl/W3TzjePvUBvLGPJfEO
         DlP9wmKldjiX77FQVdbCJ11S5JXiVJqAyJ7I1bTf7baAGVDf/LlF5atH7nrkp5D2VMa1
         YGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766520929; x=1767125729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gS4g2eUmeYobmFi6ysaa22ZYByOUMUYywyMHMVMh0Y0=;
        b=C9L59++5jm8JZXke867Ug2UD/GZ4W01tKYzOKEdyOYwuioLjQsN1Be6FJHVZTwI3db
         q23o/h33fnA0DaMy+wowyZ9HoHbk3E7IPlCjClxiKgmdz0eL69eyNTOkjr0fAB1bZR/R
         b7BLbga03jXytyL4QgIdgdop9QRfVcScxvHWbAMZNpuXLVyVmWla5rA7XQN9CU4aBHEC
         YLdrmjIq/mhNwctogWMm4jSQvAwaW+Yu4p58lpVDqbJaZUqQ/4AhUE75snDpkli/8dXI
         LpuYWIXYyGW/z3MNJb4W7wJchU8IO0LaskandAtRLzI+WZFcP/5ZAPdN+hNEMdQxDI0H
         ZM0w==
X-Forwarded-Encrypted: i=1; AJvYcCWEimp4tUPGSYuE8flEsD1kIQW7XeXShOBbrfVH8ft2kWvYmzfcQ1tBnAPqMQj7nRaCYuLJa30+w7BDNB3PolgF@vger.kernel.org
X-Gm-Message-State: AOJu0YxTvB3mIxo2XdhUDUpwxQD5IYPJ6fx7F7jOtcbUu5H4JVH5XJtv
	3APbu2fThNJR/3OK5jp9DvdBvk0kS1A2fSujZmJVTrX3rdlGNkkm4qVoKGxvWjU5tybJwa/SmZB
	GMrGOmeANrkfD6HZ1dGey5x7y6753+jsbQqZV92X+PvJRaQoDMAgn0Y69uf+Om1p7SAQCI/WP
X-Gm-Gg: AY/fxX4F1Og7ncOgLmcnEjQsRf+TlkMThc5Dbozl7TcCxP6HBN6PHFiFr0u6dLKKrKJ
	x290EP+DGt9QZ7Xq76Bxx11BBPA9PNtcBhwirNAjt10QIYwrFwEaMvKaGYMl8tc2148BVG95HSg
	My12glz1oTiJCJyTZVVJNq0+8tKb+PxjFCXT84CsnCsFUUASpGY8LddE91nsdrXh/5DRHeBMw9f
	6dM1MtHr8FkpW2gXADJJyTFP9p7VxuvDFtBlnSdDXgSRKKviPdSWMzekoELqWuYC/kR+NOIEHtb
	eWbHO6phGXh29Ksygzyj2wdFcT7uh4qEPXE6QEbqsPXs/Yv7L+P2LTUHnLmRL0/PNFsRRmNg9So
	USo1ctulaPqVrq77Q2YUSy02pfpYKGIVSuqEancUYtfragRCexjchft/MEg52PJ6Uu6w1v4gIlG
	RuNMfFVRwvJ/KXpi+lf7z2AEA=
X-Received: by 2002:a05:622a:312:b0:4e8:aee7:c55a with SMTP id d75a77b69052e-4f4abd02696mr220045901cf.26.1766520929082;
        Tue, 23 Dec 2025 12:15:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJ3sre+cW+YMd/Z1q5mx8ayHSvI5qfjS4r3IZxBRoAQYGRXDyv2pavw42k6HZDIj0Wn08HFw==
X-Received: by 2002:a05:622a:312:b0:4e8:aee7:c55a with SMTP id d75a77b69052e-4f4abd02696mr220045491cf.26.1766520928621;
        Tue, 23 Dec 2025 12:15:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a186287e3sm4380630e87.97.2025.12.23.12.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:15:27 -0800 (PST)
Date: Tue, 23 Dec 2025 22:15:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/5] remoteproc: qcom: pas: Add late attach support
 for subsystems
Message-ID: <zavjg2ciefd6fmlnqryzvo6vmtlk3xmns62hn2kwctpgtstski@p6kk3tn6c6bw>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
 <20251223-knp-remoteproc-v3-4-5b09885c55a5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-knp-remoteproc-v3-4-5b09885c55a5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE2OSBTYWx0ZWRfX56bkjHTY9UKw
 vFy5AoH+EL6MG801+IVYxAC1xHmgM4ot/MLCnjRwqBzhe2pZiPUkhJqqEARz4IbIj3RXiJ6jUnk
 OrSHGQ6KUbykvcVM6f9AS54Om9hf5Ir38VIalJfEu2lNKxVhN6L1efNn3+DRRVjBETNtKZvYJCj
 chLj6gp0gcCB72iiE+DoIj50DlxPQMJt2Yg7yhA+8f+k2toPz6JmifAokpmrhT8uJSgbCSNXBDQ
 s6/7gC/eZWUXToQ4rWj1MS+UlZ8SaWagIRHYsK083R2hWbOKBC5vYND61LpJT/HboT0pcjhNTeB
 tGNqTdqjY//QERGn924QsQGmeuojvhcHYfrFOAGdKS69AlenDqH+ymN8Ndz7vMDz9c2YrEemKVX
 5FkhWpFHbtnkns12/s6OBT/GghWRVlDnF72fp/0V3TOo3ntkwpqQ22eRs5dCOrFpOeeV1N1ZZ/Y
 FdZKexDoAg0FO8p8IBw==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694af861 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fuSJv2krIXeVBR1GlpsA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: f3SJZflIUrvd4juMX1zrdNFM989teZD0
X-Proofpoint-ORIG-GUID: f3SJZflIUrvd4juMX1zrdNFM989teZD0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230169

On Tue, Dec 23, 2025 at 01:13:50AM -0800, Jingyi Wang wrote:
> From: Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>

So, two names start from the capital letters and one from a downcase
one?

> 
> Subsystems can be brought out of reset by entities such as bootloaders.
> As the irq enablement could be later than subsystem bring up, the state
> of subsystem should be checked by reading SMP2P bits and performing ping
> test.
> 
> A new qcom_pas_attach() function is introduced. if a crash state is
> detected for the subsystem, rproc_report_crash() is called. If the
> subsystem is ready either at the first check or within a 5-second timeout
> and the ping is successful, it will be marked as "attached". The ready
> state could be set by either ready interrupt or handover interrupt.
> 
> If "early_boot" is set by kernel but "subsys_booted" is not completed
> within the timeout, It could be the early boot feature is not supported
> by other entities. In this case, the state will be marked as RPROC_OFFLINE
> so that the PAS driver can load the firmware and start the remoteproc. As
> the running state is set once attach function is called, the watchdog or
> fatal interrupt received can be handled correctly.
> 
> Signed-off-by: Gokul krishna Krishnakumar <gokul.krishnakumar@oss.qualcomm.com>
> Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5.c      | 87 ++++++++++++++++++++++++++++++++-
>  drivers/remoteproc/qcom_q6v5.h      | 11 ++++-
>  drivers/remoteproc/qcom_q6v5_adsp.c |  2 +-
>  drivers/remoteproc/qcom_q6v5_mss.c  |  2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c  | 97 ++++++++++++++++++++++++++++++++++++-
>  drivers/remoteproc/qcom_q6v5_wcss.c |  2 +-
>  6 files changed, 195 insertions(+), 6 deletions(-)

> @@ -247,7 +328,7 @@ EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
>   */
>  int qcom_q6v5_init(struct qcom_q6v5 *q6v5, struct platform_device *pdev,
>  		   struct rproc *rproc, int crash_reason, const char *load_state,
> -		   void (*handover)(struct qcom_q6v5 *q6v5))
> +		   bool early_boot, void (*handover)(struct qcom_q6v5 *q6v5))

Separate lines

>  {
>  	int ret;
>  
> @@ -326,6 +329,7 @@ static int qcom_pas_start(struct rproc *rproc)
>  	}
>  
>  	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
> +

Nope, unnecessary empty line.

>  	if (ret == -ETIMEDOUT) {
>  		dev_err(pas->dev, "start timed out\n");
>  		qcom_scm_pas_shutdown(pas->pas_id);

-- 
With best wishes
Dmitry
