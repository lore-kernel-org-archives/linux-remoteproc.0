Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14837219FC
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 00:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769732714; cv=none; b=EW6q5uuMmqnxZEHN7/I1n7WK6io+nFssIfZHWQFjU+LUOZpM4sSrfAIsZZYcdtAkgv7qlfRgjh2YSw/I3rfkZnN11bXmdLdsCaXdZ82z2q16c/U2V7lbJBviLyGvoo67ry9qaFaeSEHGrhQxIw2p9Y1FAmkUbG24Iz9CVJ1ZhlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769732714; c=relaxed/simple;
	bh=xBWSQE6sS6/JgPpLm+D+fhzj2dQKmuxIS8s6r/p0dqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obH4Cg07+3lvdhUgwqfAZ6et1z+BUJ24coauWsv8xLXJhFelUw/845D7wcQ7Ah/tH99a8R+/n02zSPeZQgerG02dtnjhB+irGVHkIeXL7OHTQ1tkF6eFJrk3QMyDDqzJ3x3aFwF1ECthL6M1sqc7FhCSJHZZsJoTsEjGjtchheE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eL8JL5G3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WFtbIQ71; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eL8JL5G3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WFtbIQ71"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60TH3L8B027399
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 00:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k+/DODfwQ3KtQ+bDGIO6pAc6
	mEXPzErqPHRnqZcsRF8=; b=eL8JL5G3c7YUP5QcxBjslM0Woz5/zMP/OM3M70x1
	Yr4BjlucrIgAh0/blPkZverhDpZpB5gr9L/d8hvJOW2Fi/oDCKZuDyQzXw65rfNk
	k+zZqf0wNpG0/hy/tncu+NIUy9CxrRJFTpqGpSRroqdqT/AUibPEjgmJ0WSWlYL3
	ZTUZW9qiH2pu6DHpBoLdTlRopzl2IXdagdyFDrftMx9gIsVHw+NiANpOEzbBcdoi
	/wR1x9eyQNRu6TRS3do6cyCyiZI5N+KHG02L2sR2mCzZvH+LsXtke7YIq1Nyydvi
	Es8n3tPy3gY/sucVauUhHEuyUQYki1bWiS99DGiY57RDUQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0bm5965p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 30 Jan 2026 00:25:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b722bc1be1so8275844eec.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 29 Jan 2026 16:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769732712; x=1770337512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k+/DODfwQ3KtQ+bDGIO6pAc6mEXPzErqPHRnqZcsRF8=;
        b=WFtbIQ71i6U102Lbv+VHML04ubRX3v5eB7thkr/d2D5gKGcDEQHOYAQU9RqNdnjHoe
         y/M/uvitiTM4RTc2iSlJXHt/1CLtbr+JP45ND76g79ZMJTAMwjPOK9YWyR8wufndqxIP
         BJ80xPziQOCtYQm4HMItOzv5v4P2mulsdBz7k1XDwSaqv96KREYFA6OLauZ6aV9mRfSy
         TkYoiltYiMS1PSoiJzH1dcMbQvSFCpK25lpcjeQy3/xQXjOprL4/+rV+Yf8F7O/spir7
         TVaGs2zqgDkDf5DBBOssHidVt2ccBnyenLE4hNSxEohGH1EdgdO/NCdsWde07OO7Hrux
         /rGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769732712; x=1770337512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+/DODfwQ3KtQ+bDGIO6pAc6mEXPzErqPHRnqZcsRF8=;
        b=DIFUTxbJBhcDZsrSi6+N49f2t4e/KdXmo0RkUCg+nNewjRn0j8U7cLChlGmB/t00rU
         xTi80/L8NdC2t3RRGu1unTdMPHNhMgxp7JFRAF+vtW8kGacshQUzIk0xYqh2Wa3MZrV9
         jFlZXvP1LjdTk0D/tUhET3RmO4HBzybD0/49TGYfuszR7LHRHLMUYM9Y7oap2P7s1ezl
         Ex4Z6TtVB0CMLwYdio1ZF9gee/GoML5bqsKsPGwy8eNwiAqesbKX0bpaKNI91LJjFuRA
         +K+cfc7LV6jCvBX0OkGyvOhdpgjf1Rlu1ghEESw5oMQ4a5FJKh7zJsRcVo4yEgNDTyGX
         8rBw==
X-Forwarded-Encrypted: i=1; AJvYcCUB7NKCFvkJbahCUzwIU+LeQOtp206EzCwebAZ3H/AMN0Q1V3IBTCHCejfwOsOXX3dUmipzwMamMvsKu7CjEU4v@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/cNPfWnpn89W4sT93IvXtI47ZgOR7mvFli1FmPisAaRvtd7D9
	04kDAFT2psIud8elZwt6/v98ABt+NFIR6BExOaYbIRN6prNvYS+IuzEiQbtwnCLKstWVxW34CBe
	SEgdv786GgYrKodYIwdBuWdq+hYmAMPGHcWx77DEmacQOU6TWx3yZouRxdtb5fO97vz3MGUH1
X-Gm-Gg: AZuq6aI2fdTtL5Atfj0Z8cBuota9uTog9RIjL7AyjEuOtJsxPcy3JFjUlJqGwXtADcb
	7CiYHPg9fx8N8+9mF+K2H5rJtNuL9U1Na/rTBKdCpopzFNp8idrjMQC5lpY6lOxLl1zC1wEI2GR
	UNwPHr/+t1fjACJFfj2rYvEUHiGcBX7D6nYtiEiVzsNR4v09Hwqf2aEVWFlC0R0yLiB1fxafWfQ
	fcnqrDPUMGDpUfMqU3Wqm+kFmo+LW6WT6L2Q28AuDon/jaVOFmLuAwNjjykOryMHjQV9/7SMwJf
	dxD+oFEbfMH64I/XXFV+lvcqefYwxzq3+mIuDhV8aNA2fzA44//HA1BXm8coodo7uPFL6G6fA03
	Zr0J5YVnrAq4EbLOme/l0cOlvt65y+OqCeOBUkhGSsz+TTxThViOXeENLD7ipgo0=
X-Received: by 2002:a05:693c:2b10:b0:2a4:61d1:f451 with SMTP id 5a478bee46e88-2b7c86644d6mr554729eec.16.1769732711478;
        Thu, 29 Jan 2026 16:25:11 -0800 (PST)
X-Received: by 2002:a05:693c:2b10:b0:2a4:61d1:f451 with SMTP id 5a478bee46e88-2b7c86644d6mr554718eec.16.1769732710951;
        Thu, 29 Jan 2026 16:25:10 -0800 (PST)
Received: from hu-clew-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abe714sm8997951eec.20.2026.01.29.16.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 16:25:10 -0800 (PST)
Date: Thu, 29 Jan 2026 16:25:08 -0800
From: Chris Lew <christopher.lew@oss.qualcomm.com>
To: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        deepak.singh@oss.qualcomm.com, chris.lew@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
Subject: Re: [PATCH] rpmsg: glink: Replace strcpy() with strscpy()
Message-ID: <aXv6ZEFWRj6pxxwQ@hu-clew-lv.qualcomm.com>
References: <20251211-rpmsg-glink-strcpy-replace-v1-1-be06308e5724@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211-rpmsg-glink-strcpy-replace-v1-1-be06308e5724@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3QCPWYvYGa2_7jyxhoxDeu1hFqJGm9M6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDAwMSBTYWx0ZWRfX1zuQWS2LM95M
 /ErDU3xVGCsqoxs5dw4UE6WUCNV/oNeprEFEsy1aZwrt9DrkzzBcBLKx6anZcxgM++7mIzeaJJi
 0t5hbP6qTj5g8ZvNHJuAFH01uE/OKkrluRR/jfzENoAkunCWUCLlT+k/j25/i72iTey52YRjd5z
 fQQmbApCUO6ofyxt47yveCsU65x/CQiOiYwydgcFTxQUbF0/r2dzSBF8nZIF2pCAchX/U5RrKY1
 CYlvnzmdEcSp36bewx8Vb8zVfUi5wjpsrVKiV+fqsX9x2w8IEPSyqelHOqvP6PiMCNXl0LBXHqD
 /74t84orazzBhjEOSWwwpbT3nE16g4ZmmLPPhbi21xlaDILCp6D6X6H8L2ChL3b8VQGY7LO41Vy
 UhVF0pK++HUHYJurHdjv+dvSJEKK0liYiFieNjOF5eDjDjpCpkpRdN3lmCvEOvO5BfE5ebpWAEb
 PM+gJHGkv0MrLMiRV5A==
X-Proofpoint-GUID: 3QCPWYvYGa2_7jyxhoxDeu1hFqJGm9M6
X-Authority-Analysis: v=2.4 cv=bZNmkePB c=1 sm=1 tr=0 ts=697bfa68 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=PWxM77GI9PN3WSnVtP4A:9 a=CjuIK1q_8ugA:10 a=1F1461vogZIA:10
 a=5kKzt1m56AEA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300001

On Thu, Dec 11, 2025 at 02:18:34PM +0530, Vishnu Santhosh wrote:
> From: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
> 
> Replace strcpy() with the safer strscpy() to address unsafe API
> usage warnings[1] from static analysis tools, as strcpy() performs
> no bounds checking on the destination buffer.
> 
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strcpy
> 
> Signed-off-by: Sudeepgoud Patil <quic_sudeepgo@quicinc.com>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Chris Lew <christopher.lew@oss.qualcomm.com>

> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 5ea096acc8581b1aff106f4c0e2f9aee9d56e25b..37b2255495d53270521466a05a5eb97eca98ec0e 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -501,7 +501,7 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
>  	req->cmd = cpu_to_le16(GLINK_CMD_OPEN);
>  	req->param1 = cpu_to_le16(channel->lcid);
>  	req->param2 = cpu_to_le32(name_len);
> -	strcpy(req->data, channel->name);
> +	strscpy(req->data, channel->name, GLINK_NAME_SIZE);
>  
>  	trace_qcom_glink_cmd_open_tx(glink->label, channel->name,
>  				     channel->lcid, channel->rcid);
> 
> ---
> base-commit: d358e5254674b70f34c847715ca509e46eb81e6f
> change-id: 20251203-rpmsg-glink-strcpy-replace-738ab624071f
> 
> Best regards,
> -- 
> Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> 
