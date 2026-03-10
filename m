Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B02637417C
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 11:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141519; cv=none; b=LBTIRSN/gQcoL9wN8E6PzHEYTRetA1JCo1Bi4SBFoRz922oQxDGjDPR9srbntuxSndwkzFfRE5EL2rWUiz/qYCSwadUx0OI00NGXInEMILMZGAUw47oCXOB7SZ+bBEMK+6YxQ51uA5xR7tjRZgfo8SDmdvpT+zbZFYo82Mwm770=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141519; c=relaxed/simple;
	bh=VDhycqnzSIMz6WG5a+hEjX33+5RHQg0u0oIz2Hcqinw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RTJkwS2sTYnuwAWrLMSxo6ayPJ0GSG96HFnGWm5g8JScciCyP1tNKIifX5MXcfRyJN4xhrjPY7IJUIO7yRPI4U/5kRPptq9WrLv7VlXe1HMaE5MEY2on+Ety9M4RZoOj8W1XLqURq7VCxAEJYAKRlvYcgTZNwFjs+O3zDd8agFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QlYfu5XV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVbMoykL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QlYfu5XV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVbMoykL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A7wSJ43124655
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 11:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lKTOqMrwzdJe8MdvtBsaM2UISrCW3NHkw/GkPvpThY=; b=QlYfu5XVNEkLdax4
	a6RFt/XIRvfaWo7pRocjrUBpjbEbQeqOXh5SHNJQ8SdbbPlqTJTKfZyByzBoHN2R
	UQ+swfGgHjjVi6Dls7b07hgv4f461JNLHeobjgTODAQhoqlJQCII/FMcPTnD2hdk
	5+XQuc4k/dIBotnY9whumegQUwBzME05a1AZazAoqeTBUxSCNNqD7wU1HTgbpqIC
	sq7ZmA/s9lcP0D4x2p4zdDyp89oa54L2zr4xIRlMaj4pDZe3Z/nPpOsMDAjYqu19
	96RrikdGvPTXcWTFV2A0jaFmjxoo7hqaIIMS/PMjLI2qyqRac2/IgyEr/IM+T4Yo
	PQm6TQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj0t6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 11:18:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd97debc51so28561685a.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Mar 2026 04:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141516; x=1773746316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4lKTOqMrwzdJe8MdvtBsaM2UISrCW3NHkw/GkPvpThY=;
        b=TVbMoykLSkIHJh1KgQfcPtCtjWAsGk748LGdvFT47JXju7Lf59tgJFrSDfv8w/izGf
         zZ1GStOgjazeko+Ui8UvRiRzON+AcmV8DwcNj5AJF0pNntaxxh0b1sYnQmRmO21flvT1
         Dp2UZlAWEdRsPeqWI5obrG8b6Ln0az+syhHHc8+BhMknzoHvZgtyhyux3isXNDOzTwDC
         sJnklS+ydpOOk96F2Dr0jfKzgcn5v1Jx3KuzoOL2f+w5Z5/SJvL/pMfOKZog/cnckopV
         duj+sCI3sv3BndEBAVXay0HIrFdY6JU/2perA6rEYdacB7uYluA0seTeY1VVI++UMOHp
         Vy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141516; x=1773746316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lKTOqMrwzdJe8MdvtBsaM2UISrCW3NHkw/GkPvpThY=;
        b=mq5zVh57sjGbm4yED4pAt6glsdftoWKy8SxIsMXbtvVE1G2BfWrqC4TQS0j6LwKsXX
         j0phGLD4IehwmDpqcIpEUkuC1Y3X9b1Ze+PoQH3GoFucpd9dGY7vN8Yn1METLSeEK6Lh
         283wAVntJJAla4bu4a+QbrpOE2/TIT+Ytnfp8SrtGgvgmCDmQWJ9uLAoUsj/PS6UrrZX
         SwxsgN1zS5wi7Ka+WWk7G7b9eQrAdW3TS+gWghQg79uuu7YDMbhVEFc3IFjFcDZG88Jw
         1/cnZx+kToCbbRuxmq3V8cObCuKM9Hd4ivApNJeo04v4D/m1uWkOiEiaAPJ5HdxyD/EJ
         LbIw==
X-Forwarded-Encrypted: i=1; AJvYcCVZAwfWQp4/ORCvdIf8Cp0NP/26EAedBDEcOxRaEkOeci1qVG/o9rBIjooOo7rFM3Yq9JMcwsadYsw1sdk+hOWx@vger.kernel.org
X-Gm-Message-State: AOJu0YxbKKqpRSe2X6DoAq1gkwx9W3KfMEqQUYOzVS3hb9Ld2syUJNoJ
	ujXXKCAc+xC54qlXf+Dw6mMRmFBoVzCsn99b/vZTVAToYokzcFMZ7AzPHtfKtEYLSDiL3A76I01
	43e02vgTQv/FVhZbOHZa+plGR0yj5pHUUa3XY4qC/PvyTbkbX/0u6AnXrKQsmYSEdzKTlpdHz
X-Gm-Gg: ATEYQzxLr8SPIIc1PNi+IQMY0ZwVyE5gf8pX3YS7pvDLEmtoHP1V1sAkoFo6ZroVs/b
	aRPqJd+l3FjedHW/EcXxaoSXHLaBu5ZXve3HIlpX/oALfAgfA4ATaEFcvO4EiukWHAclXYdwTwE
	YLtsGUwXuiE7hkccE+PVpVya3RQsgc1x8grjXPhaf1cVvPuNEGAqwIZYTsr7GCb3cLvA0Ya6Upy
	stqnX4auO4OLncwnlqFrSk+AdKetcJ9cCWefARWjuERSOaX8Ti0HwYaiEU+P8lFXDAHBqIRJB9F
	1QB1xCrsEqjJE30Z7WsssBOmBIwn7h6VieVEjZtabuyJrhQ8fS66nBQQepwCExiFg2Z0TAPe9hJ
	DlfJoNFL1atMvHE6F5UTeXsvcQJFkiJk96EdxvLmq+tfUtV8zPDn66l+kgY53tw6l9UdyOV+Ld4
	P3LeQ=
X-Received: by 2002:a05:620a:1a83:b0:8cd:90f4:326d with SMTP id af79cd13be357-8cd90f43559mr437812885a.7.1773141516349;
        Tue, 10 Mar 2026 04:18:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1a83:b0:8cd:90f4:326d with SMTP id af79cd13be357-8cd90f43559mr437806885a.7.1773141515744;
        Tue, 10 Mar 2026 04:18:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a4fd5e9esm4078116a12.21.2026.03.10.04.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:18:34 -0700 (PDT)
Message-ID: <a96cca02-54e4-4ed0-9fcb-816c72afe0e7@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:18:29 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] media: qcom: Switch to generic PAS TZ APIs
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-12-sumit.garg@kernel.org> <aa6O5tir4kVIe0eZ@trex>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aa6O5tir4kVIe0eZ@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69affe0c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=1RngqAJXY2j47DovaP0A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Y3RCxZcEj8EcEnq4VHYU2x4dSAVUfpGh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5NyBTYWx0ZWRfXzMCMmAbdzgzS
 0JiZC3zEVqrTTsF+GPBU4oG1fZZ6V/OrH2LR9F5jbKKRTSs19sRea/8Zq3rjOHjmmx4FUE+RV46
 /MBuwOLxAcu2tJ+nJrElkBPON0/7OnRzASc+22AvQTXauTqZry5PMbM4mryGQc8UjUbpxJcsNJJ
 7bf3zGva0qStJmw7fqSa0RM/ihWnAg/zgTd9iLntKKymUobTU9IM2YgbNzOuujzj68HWuIys16H
 g3lxKjBXeEi3lVAt7IdLm3uJyyo2HVtzOpbp+xXbLb0VkcnwUFdJB+OVX5a7/zKMtfHeRixiztF
 A1BKEBNV5388bWrR5O5T3b8Pi2fHyHXrjunAGT9Jl3Xj4KaFjH/VmhwTtuE0195XSXMS+EMBovj
 04L7RPnUM5Tngy0oxjYQdvSE7WswMAmrBmFlpqLRkr2jTMdMFwkm0Rfomozuly/9leD8mBfr4DX
 VpFpwZ+hRUEzY2KZ+UA==
X-Proofpoint-ORIG-GUID: Y3RCxZcEj8EcEnq4VHYU2x4dSAVUfpGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100097

On 3/9/26 10:12 AM, Jorge Ramirez wrote:
> On 06/03/26 16:20:24, Sumit Garg wrote:
>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>
>> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
>> TZ service allows to support multiple TZ implementation backends like QTEE
>> based SCM PAS service, OP-TEE based PAS service and any further future TZ
>> backend service.
>>
>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> ---

[...]

> are the calls to set_remote_state required?
> 0 is not the IRIS/VENUS remote processor.
> 
> If it is legacy, maybe they can be phased out?

FWIW, in msm-3.10 (yes) QCOM_SCM_SVC_BOOT/0x0a used to be called
'TZBSP_VIDEO_SET_STATE', taking the arguments:

args[0] = suspend->0, resume->1
args[1] = spare=0

seems like sdm845/msm-4.9 still had that and so did 8250/msm-4.19

Konrad
