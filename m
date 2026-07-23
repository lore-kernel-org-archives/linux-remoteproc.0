Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04A63C0634
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784801783; cv=none; b=UH08YtIOwAIpT+NcY+BjazOqEg0fRzQwa7NsTrtxZKhCzHBp9ldhH3O703594F9zFdEe9XZVLPALCLjiYp2DrdhcM00tvfGJpcLlx+f10Qj8TDZSaf7nqH876H38K4TGjGUghOZO+YTvQBilmSLiCFuv64pcY0j8KHtahezURLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784801783; c=relaxed/simple;
	bh=OOzxk0j7yI39H5AAbUVVegB2Hx5jR8U3vPwKCA3cJcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NEROpIpm2xsXH7lDVvyjuGGaa5SNUNVTFA4abw0dRcYEvA2IhrP4vGDepef90H0YqFvv4K0AA9ls+B5SfrFlICyo4qbBTFPR9xlkEXaYKbAHadYAtf+NsklHCtRexQXyVMcWKK5/riSvYxS7zEYsYvjRlGiCIw677VK7AODDu0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DJB7vrJ2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CcvN3cny; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DJB7vrJ2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CcvN3cny"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qdqM3668144
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 10:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eTUkxGPu6yjD3DgvQUN6d2HdXWpUU9P4B6iCx4Rs/ik=; b=DJB7vrJ2H0i7jGyv
	XkeifS7mF0TvPEvMi10gub0RQ31XP6G8aMqELSt739/wT1zJY9rKRFiRNElWQkWg
	ekWpuvNyeh6+F38csSMFXFIW0RggFqUvw7QW219naytFbyAHjkm6yPNLUn7388E4
	M6xAbBTKYtONGKPoCoNpfQFA6Eecu0jvxw6HJnp/kTh4AjG4vTyLboR+RWgyQ91M
	njfSbo3EpjO7P0f490nIYtKRYFI/NjfFohV5/BbZ4jLbxn0LqqoehhQTWKKvMUjw
	8dHVMY0GMGqKu/jjW9AARfZxYggNhKgqkhJZqw7b8fJMyaNTHNezrt4AEUpKPuIl
	ZQNqew==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc2psw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 10:16:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfd1772d8so1670911cf.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Jul 2026 03:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784801780; x=1785406580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTUkxGPu6yjD3DgvQUN6d2HdXWpUU9P4B6iCx4Rs/ik=;
        b=CcvN3cny+s7J+yMnU9+iBeu8W8F0pv0X7j/1nperazhKHJDqc2mHKxRFbZ75cK+E28
         Corh3NEchF8Uq3oPZPg9FyGlR41hI7xnWZvsHZg0plIplDXp3RPEUUAokESn71VTHweM
         Wldc9KtBUQK2I/S1KNJl903owkil1BRbWvovzeHJ7yGiqpeqbSxzQ4Mup1UHDyh28aCm
         eCncH5wvPd2dJbBF1y63AbdS9uWMC6l8AbuMt6NEZWJOOb/hA31KRD0ijX6SSpWJjsBl
         /I+wjVp6AG3tDdgiV8mU13L9Vp7uG59ZYfiwZsgP1YBnXnSHvfqdleZYE+gWeJ2nsuII
         V8bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801780; x=1785406580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTUkxGPu6yjD3DgvQUN6d2HdXWpUU9P4B6iCx4Rs/ik=;
        b=KiXE/EKXGK423odauv3Tl+HZ3cLQDATxmKblb+RnAR8I8LjICxJgdXcl7osYWDqCmy
         iITmrrjXcUoRA8ETWyTbEKHqDDR9IbebVq2VFe6xpeY0cxt3CtT8H98NgIRLN8OxThmY
         NWy4HuYIKiPqA3YEX5MAKkGV+lObtb9gWd+Ts382p85a1P3XqmuG9KIjIXP0hmMy5VnM
         kdnyfgjs5BNBNfDWYgfv2WH4ZeBbCUtvMViyjdvpI3xBX83tdicGErIsxThU2mtP1o0h
         M1fT/Sdr3Pk/MAApvBHj0QbKz3ksHRqR0S2HGBLGkqxbB2ZR6omAR+g+KljXt/VFil11
         wlhA==
X-Forwarded-Encrypted: i=1; AHgh+Rq9Q5itd3JqA5gx/GYapCoXXomxKQQnnEIjioHsLSU239+GsZeymPKeb4gzBDXuCPuXY8Ebx+oyrD1wmTsHRcoI@vger.kernel.org
X-Gm-Message-State: AOJu0YxhD4Pd2jvR2CumQfC/CSvjJVRv3lzZ1hFeXk7f2E372ACDoswF
	XXYTmWLNQcDR1brsQ+kNNkCH6Mv0ZSFzH+m/KCwzMLnFNo5OqUlo/I9Ve+5MLwhsItpFmYIDmSC
	2vP3WaoA+W85hEfinzPZc7UlL053eJBug5KuXPdf61JBYVBVt7mltJCusj+tL0Wm3XqqIUrFb
X-Gm-Gg: AR+sD13M53wohlGox8rdJiZRlJfpZZmnu8c/8gnctTrhWErmiaD+O65GKUxw5UqYrWj
	b/Aquo+Qj9JH3WUInCluv5+Y8HgAcm4yFByjgYa8FiA17X2qXQ84zqefqT+JQl851QQGUIQXjEa
	vJrSfix7aJS2QxYX4SN9oCQDmQTNc+su6HNBZ8FsxABZcAIEnGqFuEC/76maANmAx/a0zj+iFbc
	p0Jz+r1j1XHtVVaGz4MpKrxu+9Nu+DK0pdlI1WxgBQDDEK4YV1yt4ahPqgQzDE2zYaZIasCqVpd
	yjq6OiIMqQJy5VhUe7mANHxQs6AAlNH/sSz3vQyqa1PmG/pekCl/Xz0rGY2/5ShhlUdEFeIn6mV
	wBSH/Ibki7/ApO/axOWXguBMX
X-Received: by 2002:ac8:6f06:0:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-5283dedb47emr16401571cf.6.1784801780091;
        Thu, 23 Jul 2026 03:16:20 -0700 (PDT)
X-Received: by 2002:ac8:6f06:0:b0:51c:4ffa:9b71 with SMTP id d75a77b69052e-5283dedb47emr16401391cf.6.1784801779644;
        Thu, 23 Jul 2026 03:16:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34b92a98sm1923256a12.10.2026.07.23.03.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 03:16:18 -0700 (PDT)
Message-ID: <ddafcaed-3c87-4f1f-94d5-629a2c0ed18d@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 12:16:17 +0200
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom: q6v5: Request shutdown if crash is
 triggered host-side
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Gokul krishna Krishnakumar <quic_gokukris@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-q6v5-host-side-crash-v1-1-23bd53db90a7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-q6v5-host-side-crash-v1-1-23bd53db90a7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3ulFCKzLdrKItlhB5eMCTmm5rpJIbaoH
X-Proofpoint-GUID: 3ulFCKzLdrKItlhB5eMCTmm5rpJIbaoH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwMCBTYWx0ZWRfX9wsIOEfgw6zU
 0ce5e/GksASBRYLZxnPcfyJkeSK7/oO/4VOHtqcpRTmbPioWA8TersEHaRDy2v/n+Gkw6w0zLgu
 UA/GMpOpafVoCqN7kvGhezgi5Sj+Ve8=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a61e9f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=sz4EqRGSCKQxEAjEHVwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwMCBTYWx0ZWRfXxhveSOtEMOQO
 gavbcS6B8/bMX+vzLytHVSXpON2ghQryfgGQJv/o1ezgR+j9vEohm4VJ+dAgY5qQdBH/62ksyoH
 s5zg4Qkq4CsDuN+Fr6IfC5i5MHuhOhuThsyMNcvZ7CkSqUEmMOVnNpuV85R3jYHwe7Ymsh8Em2q
 OrZ8mkcwPKvQM0XgWjLCaIKFGprkMwB6ZrZuazZyw6Rt4MLfDeu+5Fw3fulD5X2DuFf8Q1dB/eI
 mKG5pIKTj+5APgd5q0sFyJYgduLB3P0ssJYunzhPERWQqdrz1tUy1M6GdXOobnNwlj+LkAP0zgd
 yTuu/HNPLEl87mRXfig1pN5d740M1Sa5grnncWLjS6ZXhkjC0+91+HTpqxteO+F01I20imL/vXW
 ibn3YlxLpueSlPOHoeHeGlHtYU9kC8ickPANvz29WNjjBua/BzBQp1gWvNp1z+3/hA64I3jRXTe
 zBoyMFcC5Airj1oUsMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230100

On 7/23/26 5:00 AM, Bjorn Andersson wrote:
> rpmsg client drivers are allowed to invoke rproc_report_crash() on their
> grandparent when they determine that the otherwise seemingly healthy
> remoteproc has entered a functionally broken state.
> 
> In the crash handling path qcom_q6v5_request_stop() is invoked, which is
> based on the current rproc state whether to request a graceful shutdown.
> 
> But the current rproc `state` will be RPROC_CRASHED regardless of where
> the crash handler was initiated from, and empirical data shows that
> unless the firmware is taking part of the shutdown the system state is
> often left such that it's not possible to start the subsystem again.
> 
> Use the `running` state in the q6v5 driver to make the decision instead,
> as this does represent the actual state of the firmware.
> 
> This makes it possible to reliably trigger a restart from client
> drivers.
> 
> Fixes: 3cc889eb83f5 ("remoteproc: qcom: q6v5: Avoid setting smem bit in case of crash shutdown")
> Signed-of

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
