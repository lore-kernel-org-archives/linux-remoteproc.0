Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7911B4242
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 13:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415607; cv=none; b=megWBqAQIV5UN0qd5r74ujRlieF3a45o6aOeAGI2kfVvfFEogQIO14Nx8Ns/J0okoXEYOztkJHkCVJT5tf7TUJrocW/9fiPukgkrwEEyo9/HXlXsEtByfkq6wUoV6H6PDR6nKFAAV43q14NXOKh6wSoea8rgl1uKOFTpj7uTbfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415607; c=relaxed/simple;
	bh=rJwd76XakKbW6cxRp8U5C3y66nF4fzEk7nsIfRq8GqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQQVpmoMOoP79av23XbDgEoKjP6rRapvkj2iExMq+20nL2ew0/vErDGGVx34QxlOZfRJp1gqOnuqta7TStmFUYPkwqgvQsrcqiU7ZSs6j9Afvp24dSvPwfzmeZq+mJqAQr4ou789K3guqeq/pPXXvFGGp6gdnHuSu/i0KMxpWaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3/qI/lp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3/qI/lp"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAbrAq020411
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 13:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MzGZGH78O/v7VDsO0hbF+sd8
	L3WE1LofXSiV/zXbbD4=; b=d3/qI/lpCL5OMx0yWudKghR5Ka1Om5c0Zomxf3dU
	V615Uvp11b6aR0VNPvCfbVGDyrzoj2VGeg6LlCg1/Tj4JWxpgjdxwxNZR2iyQPCF
	4KWsRP1VyGNDDvU+knRPnTmDm235qSfanwbC+C89naB2pizHreeEsm1/sfecsm4/
	JeO+cK8W7kvuplzdnDLxCRKCfwq+A0FQZV2o5sb/gqa4WqUP5Dn7HwJBYs6G2Y9C
	9kdf9iRn59ls8JDeC1w/ilmyrOsAeW761JLPs38rd+3otMYucsAjxNNXvgrJxzss
	B58J6sk4sm5HBsCkfyvhFG5XjaYp4I0ukHWipHXkwmHb3w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh229ms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 13:40:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c543ab40d3so984314185a.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 23 Apr 2025 06:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415603; x=1746020403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzGZGH78O/v7VDsO0hbF+sd8L3WE1LofXSiV/zXbbD4=;
        b=fLbpw4GmuAM0AcEvSzp8ZqqlCSy2sk20sNHTmFjCfk4aLUi/M9RICjJubDMlZX40dk
         T1hoN/V22mll2jvQbjRse1RNzUOWw6nx5HXCA/0NrrjEjIgTNeSOXjJMLoRrTZH3ZITW
         qIe0c5XG8MGTOn61bCFLGwTaQM7xm0VZl7cUaPzdaCfDCRytkjr0hyRAHAJNQ7M0aEqT
         fNEXK5llvkI79oQ/oGUykKyw01Rue0VXnV96Byg62sGmplhAPQBZajs6ZgyFC6R94TFn
         xWRm051W/HAtSL/O0QlZPEmcc4uVUQm5kCDaaWhGzXG9d9mZfIZL6NSeRIoagqj08vKy
         HmFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5biQ2QadyL+k7a66Z70hfL2Xo05SvEAcz743O+MIlbTizLQ10LU6/GUg4QUokGtqPjhbO7m9kcOrjyC8wLVAG@vger.kernel.org
X-Gm-Message-State: AOJu0YyXw1geS6GUHMF1FjOOppo9HR3pSyllIlC5Y+0/7QZruGfy4Etu
	uyZiIPHJ/NwgtZyUOTxcQFCMxhLn8jYXgoUERbXPGbx5QS20OW9Jtn6cDA1SQoqtku+CkPBKBAh
	gJDHW7K8Kl5Su64pdS3RWxnxKd6ax26yZeaGCeQeW7TwYLuCSOjOFNOt4s0vilGtg94mT
X-Gm-Gg: ASbGncuXPqZs0W7Y47aPcxGaH6hTljKadVRUsX+5DZkepM2mALOFvz3B01jsZFU/aEQ
	mCNJ1JxY55jrtdnWSlKdAyHUNocpBYoJ/JwpJG2bUXLVz8muiZ0nO5fgFp4zFXLELgKOrJO/tLw
	WB+TmCswPDKu0u+0lGdrCSBSOXnqmZGOmVfyu4X9EUNxTQ+wluUZuXL91IqJa2AJGZ07j0JAJGf
	9ru3e+JVJD4bUtQMqokk6XCR/pdSSmn5XEyzETAmqL4F1Qrb8PAT+xImd+DlHGdUe7gNG2EYg7p
	9XymMY+AC3TmMeLguN86kSRpgSrIwGbM69J6A/+JDomN8v15ZuQWRAB+3aJLKDGONpU88zx70FA
	=
X-Received: by 2002:a05:620a:4001:b0:7c5:3d60:7f8f with SMTP id af79cd13be357-7c927f87cc8mr3328124785a.18.1745415603151;
        Wed, 23 Apr 2025 06:40:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXVhG8h0EHaKSHuLFmXYtc89YmYuzioiRWb4XkNp4qE+H/B1Jd7+nH84J5Bky5hsij5Y6aHQ==
X-Received: by 2002:a05:620a:4001:b0:7c5:3d60:7f8f with SMTP id af79cd13be357-7c927f87cc8mr3328121585a.18.1745415602827;
        Wed, 23 Apr 2025 06:40:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-310908270a7sm18290281fa.66.2025.04.23.06.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:40:01 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:40:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcs615-ride: enable remoteprocs
Message-ID: <n3o4a7jokelces4jioccoub26ikwpeyzuc4ac5uzvumqkilha6@gc7w3qpb23q4>
References: <20250423-add_qcs615_remoteproc_support-v1-0-a94fe8799f14@quicinc.com>
 <20250423-add_qcs615_remoteproc_support-v1-6-a94fe8799f14@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-add_qcs615_remoteproc_support-v1-6-a94fe8799f14@quicinc.com>
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=6808edb4 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=2fRsUtMu-athF6_tqjIA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YInfwJuWhAnHCJkUTHSgp7KuMsyQxAAK
X-Proofpoint-ORIG-GUID: YInfwJuWhAnHCJkUTHSgp7KuMsyQxAAK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NSBTYWx0ZWRfXw9vuX+Xffs3w eFT8N5vEJgPvSAP+qjFutEy5bcMZC1XhfoDsaFhTyjUTyPCzhNqeH2TkBJ8rx4yX2aWUppDZoR8 QSAUEs6Jz7/Ra5LvvIS+F/Tl3Je3N0GmRG621OFPqNdgGb46Sn+YwgzQO8nY6CT6jo3wtmQeYC7
 3LMWiGcTjB0ZmEywGYGRcSvpBPOdx0h3g2X8Vcpx+qfwGh+SlD6ccXRlWlgayV2f8Qj+QfQVMcB H0nCQrhjnujwg8MwSBbGdlKO1MQRHN7SMJFqK0GRMZJyIwCKeQBbyQWj5PHKQaI6HoSd9FJ10+s nJ3pFSv6nNo/AWGY6Bz5EhrOvFTdUvSVtu04hzstz7h/t98Onj8XqGST1daxBtVNm09te5pZUJY
 c0g6AjufL/CG1iizBiN6IXcbbxVsfuRswzIofZl9bjDqW+BconSahkeueFD00Ndmgyn7SsUr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=844
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230095

On Wed, Apr 23, 2025 at 05:17:42PM +0800, Lijuan Gao wrote:
> Enable all remoteproc nodes on the qcs615-ride board and point to the
> appropriate firmware files to allow proper functioning of the remote
> processors.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 2b5aa3c66867..b0db2c3ad409 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -240,6 +240,16 @@ &qupv3_id_0 {
>  	status = "okay";
>  };
>  
> +&remoteproc_adsp {
> +	firmware-name = "qcom/qcs615/adsp.mbn";
> +	status = "okay";

Empty line before status properties.

> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/qcs615/cdsp.mbn";
> +	status = "okay";
> +};
> +
>  &rpmhcc {
>  	clocks = <&xo_board_clk>;
>  };
> 
> -- 
> 2.46.0
> 

-- 
With best wishes
Dmitry
