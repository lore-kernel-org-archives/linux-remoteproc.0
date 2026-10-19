Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445865;
	b=UpXRKJEQelMkyjY6VZH/7gGK9WQV0pr1fKCdtHjDyMccGdqDSYon4pPJ5dZdl2aabCrG
	 2gNALXLvJS32VV+7RXo+nXd+TcWhGEt8WmIgMBQslP3oYijzBnyorUssJsFBdjf6D3WJL
	 yF7BV6959ljEBDq/Sol6TofI7NrmE5oi8358uUhhwvrFeqslqSs9lC801fjqGrEqKcZy/
	 +9t1yveHLkx9jCV5lDHuR/mmNyajHrAuW9S7LFtqzELldpJhSFjAHfdu+BOupdW18DdTJ
	 VKietNvVYlsLNMVz0nbJoIhSEjzOgTngH6VfVyEczLcghnCWUM3PeVKAQEw6Ntv03KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YR7IFYT5RaUwifn6Orf77wIJhbjy7lkSMcEb8T4uCjY=;
	b=oXmRDenRzv+clEdjbWvC9N7Zv8uIChRzIh13TOvi6HCwPgIJAnuTlDXtg1e8iPlGty3s
	 a48J8vV/09E00WIPXmOs1L7Tbq6jGgknLmrqLwawXow0eIeO02PEYS8LfAONqOOPXgWsE
	 sTEtQTtY3NW6CchP50QKK8sLUHXlqkOihXWESjwNiMPnkLu1QxjFSfZBWuX1acvG6ExMy
	 BXSXXwK9nsATyhWi9WBn8gFSiGxw0I6KV8pFj7wipCV2tzlsjn0DAsRsQH9MOsnnCQ2R1
	 4dxx5PSVOYCCB4ExYGh8Yf3PljixXM9uG3oK0ip+BQvthepw2e78/lVT6nt6elOBadw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="pJcK/qha";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="j5MrQ/qE";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7F7606A31D
	for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2026 21:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A7F7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pJcK/qha;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j5MrQ/qE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLa1Z7793176
	for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2026 21:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YR7IFYT5RaUwifn6Orf77wIJ
	hbjy7lkSMcEb8T4uCjY=; b=pJcK/qhaee0RFV176+sf3IOhC1NqK60aNyrNHoxC
	vzkKauCsVoayYvpo2I8yLrSGFSFMPLd8xF0HNKyCBKC+bjqjqEN0DXLY5kg9XJ69
	ZJ9NsVHSbPcwzDRHAR97KUZithqxr7blLJs0EOxMfyitMXdS13I6kHzBGSCfqp+0
	HEgtv9MAJTpNXCsH7BDLnCzFZT8QyeUE1b+Wk45qHzAiDtIzVAcy3iCSu1xHNbsr
	zzrec/i2nffdZmRon4JdBk45/jHh9yIk5FLueo0qoVgwkyw3pYGY4WDx5av+GujZ
	+Y2X6DKFjg0WORhymslJXv9m5LYIOxTAMjcO4RP0GkHafw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3fbcbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2026 21:37:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ce7a85f04so531341085a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Oct 2026 14:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792445863; x=1793050663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YR7IFYT5RaUwifn6Orf77wIJhbjy7lkSMcEb8T4uCjY=;
        b=j5MrQ/qEij0K+79ExcdkQxLwYvojFKdtmSI5WOfWps1nhVQxnYZHrKKf8ngBkt9C0X
         jtTklS7vOAlI+bpKYj4dXhtiGHg5PQUW4yoolT64NsU59/ni6IBeHh29ougID5I7Bo6h
         KlcomfGBhszCYL6ZBGgvJo9fAcqni/GDUZ86HRLL9QAPLpg8IRhhYgMbalNdh/gD4xFN
         IINQgSr4mF+uAHKAuedXdGzRDjNCg5avOyiVJye0l2woeSttUnyiJGKyS9GDM5Jb/pK/
         7kA0oCHbQOYi5uw301JI9voAWQdZNs7WaSuDyMqqAINzUUyJIyYThWQuo5CMJPLxERUI
         Tc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445863; x=1793050663;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YR7IFYT5RaUwifn6Orf77wIJhbjy7lkSMcEb8T4uCjY=;
        b=QYAfwI58McguEn9bRkheToxRgRS54Eq/7XWuz0hF/JBnxEncCM8LNWFpTtCgtzemyR
         7lYJy1T1t7r16X+sqfAhqlSCF3VcD2HICSaf5/28d2nMAtcIIXzM4Cw3dA1lqrw4zlWL
         zdbExjR5tG6flpAIQ6F5SV5Mra8vSu8nOk9avo2sB1h6IjK9ewIigEs5TkjMDU5+ZWIW
         CC32WH8CCC7zPjEnGYPfrKs6DEdggD4W+1iYD9397wMc56FUD4O1r6qo2QJGhabShkHw
         fCOZSQGZFmK61cP8ZLik5Mzo9Q588qXJU+AsQ8UKXOEJHREHAba6iwsbalbR5CBtltsS
         qlDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMtFXPfbAxKGo4BBF6E7NyxMnvuTHeIFCCOkc2dUpqY+3cyXN6217UI65bShdI+F4D5VTyTge7/4yGoLztRbCh@vger.kernel.org
X-Gm-Message-State: AFq9FYJbbI7XVuiQZvLPb7wTUWg4Fn+q57u56U8dakZOxa8sPMql202M
	HL6Jwzg4WlliDpRMaVO1B122QE8ecjycPFS5leQLfDKCBYmgy3kV78iOG8DtxD4x37ya8ET8w+7
	bG1kRdUPvyvkY+8gwGnxOIJQs+otgzqWHwtIaEiFJggCdyEFmfjFA9GS7WyouW8pgbYwqWJsK
X-Gm-Gg: AYBFou1pgEPryPEKiul/vm6lT2WT5+kAqHFhJhY8DtcuOUbiTRP/xLrrsfk1C5fxig1
	T/AcPPJ9SIHV5ZLnBjtp0BUM//DNb6a1+36E7OdAZK64AlgqSaA+nxRU6yFxwB1CFkrOKrP6ECj
	3i4N48NJWiqwUpAy6oz7Zzr+beJbZrlGvl85tSl8DxNivcrccfaNBc0IGAX+nvi8hPAKTGFDze4
	+0XzTcs5uxRo84o+mskJUcwOrUk0MM9aaVLRMgb38Hh+1joIxb2sTwQUHbgo+DOHduE4W1pbZ+4
	r0Npu4G6apqyqUNfCJFX/Cbl69zoETmkbTTb8oBt6ZE9/Z5HJPnkvCpjfTwUbUjEq1zA7+zcn48
	FAkjz1lR0vltngCHFgsHa1GD2vznM2zfGUkG+x3/4oWm0lnGBVYtD9XVzansHWnnQ57ViPKjPuP
	rrFG7gkCS+Lkgv
X-Received: by 2002:a05:620a:468f:b0:93f:242c:f4e3 with SMTP id af79cd13be357-93f29d2cea2mr1487453385a.32.1792445862571;
        Mon, 19 Oct 2026 14:37:42 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:93f:242c:f4e3 with SMTP id af79cd13be357-93f29d2cea2mr1487447385a.32.1792445861844;
        Mon, 19 Oct 2026 14:37:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a63cd1esm2232451e87.72.2026.10.19.14.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:37:39 -0700 (PDT)
Date: Tue, 20 Oct 2026 00:37:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 07/11] arm64: dts: qcom: sdm670: add adsp
Message-ID: <ya7xujl563xnvdwznmr64j24q6vao5rqdbjac7tx2azbzoezon@b7677fmbytj3>
References: <20261003175659.23536-1-mailingradian@gmail.com>
 <20261003175659.23536-8-mailingradian@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003175659.23536-8-mailingradian@gmail.com>
X-Proofpoint-ORIG-GUID: ujgf_v5gTdYIBP0xOITiXZl5_Omc2P5r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA4NiBTYWx0ZWRfX8FCeX6Q0Rutu
 sg64n+4ds/maM+gySRItlEye4Q/TJUWuDq6VLf4XOAK4f0R0PdpXP4D5jsSUfi4V9jHVBxFk4Mb
 GBl0iPAzRGcaRMeXz6/OLWEbKF8974F5Y7XlltWh5SnNpE7zH6bj2tMPfqqVFctPLNv1dtmnG9R
 lH99ygoYv0ewZlksoXuo4QUgVjVxiKZw2kz3gVkrDPv44u1hPNh327Wz/ua7AmAV4WeWWgaSej7
 NNRd6NR6e9KMWRgjxAbVZXEQRe5ultCjy2Rtj+UpjusdwOUw+ax60B9ATWQXRH7IWTcFDz4bNf8
 W3UBww6xgSugmyqTGbdscN1k2R+yGfssOzsvEZe+M7uAdA6XTUh1k1FXrWMdNLru1+vvK34wJjv
 xHMB5VZL0LPEYqn9zjFbtWoPd8V8X2PTBZ42PK0xjhIYO1SROeSGTxTy+8yDcypjq1EUCylqpmF
 eDNDKL8O10XvetOqe4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA4NiBTYWx0ZWRfXzGd1SDDjeaK7
 sfMu8Ho4QU/xTeXFGLoUxZQ069p9TglslUbaHBIgoi7tB6EKV90sPojeq4wCubucbLXAg+ocvym
 CpHtQKUlDWMbJO1TF/ReTnuDHOJOa9E=
X-Proofpoint-GUID: ujgf_v5gTdYIBP0xOITiXZl5_Omc2P5r
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad68da7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=7JjGCdC6NS0evCYxf5kA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190086

On Sat, Oct 03, 2026 at 01:56:55PM -0400, Richard Acayan wrote:
> The Audio DSP (Digital Signal Processor) is responsible for audio and
> sensors on SDM670. Add this, along with the SMP2P nodes used to
> communicate with it.
> 
> The sleep state is included to prevent the following crash:
> 
>     qcom_q6v5_pas remoteproc-adsp: fatal error received: err_qdi.c:450:EF:sensor_process:1:sar.cc:27:chre_utils fatal
> 
> Otherwise, it is unused.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm670.dtsi | 168 +++++++++++++++++++++++++++
>  1 file changed, 168 insertions(+)
> 
> @@ -2301,6 +2349,126 @@ cpufreq_hw: cpufreq@17d43000 {
>  			#freq-domain-cells = <1>;
>  		};
>  
> +		adsp_pas: remoteproc@62400000 {
> +			compatible = "qcom,sdm670-adsp-pas";

Looking at your DT schema... Can we use "qcom,sdm845-adsp-pas" as a
fallback here? Then you can drop a driver part.

> +			reg = <0 0x62400000 0 0x4040>;

0x0 instead of plain 0, please.


-- 
With best wishes
Dmitry
