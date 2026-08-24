Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644903A6418
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560014; cv=none; b=oaY98mPKc7B5YpvwDDJKIzaqX4N8Rbedb2H0mfxXrw8TePRAlNQqD8II/Fz9O1l9yXjD1vscHa4xwSIKWeOzFVovMvCThriF6qL7u8xT4v26YzHNAQuQx4n3b3kAqEJU3unDtpCJgfyLiCfn5Jessx/hRBjKg8fe046aH9UazME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560014; c=relaxed/simple;
	bh=Dd+7IFNuFCUaFNilAT23AV3amNqbj8E5ancLP8ZE0yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SjTwcYcNiVdPs0voZIQE/6RNYdBxONxeS/bsMT74M0mpTJ7j3OyZ9vZVaEn9KtxbZsrNl4gTD9AjWHTPDWaIt9WH7gUH8zSjEzsHxghR9ESL2vdUOfTdaAYuCKMR30rTQ1fW8waKpsVkFxCdFwBvlZ3T3AieZN/j6quLRCGp77M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DkLjcrAd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kW3RrzJC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DkLjcrAd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kW3RrzJC"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O67eQU1662629
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 08:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rVn8fxYfIoZBJmV1J5r8JZ/i
	ZJ+bvsQgkpm5xup6AAE=; b=DkLjcrAda33EQ57Bsm4cO+8qMFONVajh2yXLiUrn
	VTV0N0siBW4iY7m8a9TkdxUMW9FakiEzje1tCex6qBM2WuLonBh9TSW74JlfiFHu
	Uqyd/+fOUhNWYz3cFum5yDlHp+bD0UOHuwluebRcpjP0HqylvxBt0yeIrji0Wobu
	XLlddOcSxuL359Du8FLuY4w8rLwNysQMRp21oMQobquMlSm/+vZZgNnZZ78vYK2g
	NnfzYvt5nJbZXAJ2qeFVUj5No+juj8HuYxx0HlVvUwzo65vAUq/jhWKB8SNw3jn+
	/3WqqorNZyF08uEwHvxKLjXUdaazhbIRKYKeteUi4gaEZw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsgkqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 08:26:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ef8249f871so33599666d6.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 24 Aug 2026 01:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787560010; x=1788164810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rVn8fxYfIoZBJmV1J5r8JZ/iZJ+bvsQgkpm5xup6AAE=;
        b=kW3RrzJC3lTdwHeoWJ+eisTpp8kBveo4vDAkOdWbHjRqc6LJHlHl+AuhROex6PN4iZ
         UCsHN7hCreMXT377e5d46Cxvk5P4SsW7vK/r9WPTJpREMwOwbiqL7XcAF9t7y5oCmVuJ
         OPdq7x50EMw2ASkU+103GedKCnS7MFc8l0j7c82OqX7s4ltfAfV2px6hVfh2HjXNiO9C
         1uEiF0ZCholyzQsrZKLy2MgOZ4NwTAySbUnzw+Y0LsodecUqKpY/skfwZYBBieMJOHQ0
         G8beqEcBSeEFvF2MnuDdvmCPh0SWxM25Quu45mihxNi8SX3yVuCrOuZuJXgie+ydkE2y
         AwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787560010; x=1788164810;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rVn8fxYfIoZBJmV1J5r8JZ/iZJ+bvsQgkpm5xup6AAE=;
        b=lAjpYImA+FI00mcJ4UEB35m4HhYp9M+As7/drmWoTXrIKAm+i9MSKGM1D3LCwTaawn
         Qziamz9iDJTtO2+wI/ns7RDlRhpDqv1hPWbx5/uKtaE+MobrR9rOv9NcschgqaYgI0zu
         aaBcBFlVCHIbAmC4syyHcYFuxuhMuCtYS2kGn1ULdAMvWQa2qftBJk13IG8idDWJAV5k
         aNFZNwOE9zFEkeifQiqz1Qv2GojJ/iEuj4GM4wHY0irqvKM9kCbmtq9JdqoZ9pTqBayG
         PhiUckx7JaHud+S8AnfsT7CuS/hjbeV2aN3e7tCklEdjtE1HfOGCZgI8hvUpUU/cwBmH
         nV4g==
X-Forwarded-Encrypted: i=1; AHgh+RrBUvu8yHGd5cf1z/OhysSdo1VK8zFyFR7yN2fYCM1gowVv7YbIqDz8keURwk0KVK+eB+TRSrb4Gkmk1ZSLKuOK@vger.kernel.org
X-Gm-Message-State: AFuF++kfT51pwisZXIDvAutRqViyJKWxXl2lFeIK0DBfMAmrNTrwMfHb
	l8MUxccRtVAH7SSLuMS4C1UdPmGBHDnkkRZgdKTyPuJEKgwgZVpj4jDX9Fobg6DDIv/HfXwVPbB
	/Kpx4RVg9gzWo732f933tfJQR1LZpaiuDuXrPAk+pSLrgS0lTpcAJIvj1xDSBNYnj6EVXTpe4
X-Gm-Gg: AR+sD1309ybF8qMPx4Rn5elNH1/zbQbTdQlvapUNtGK4CI+6qUzI1xGaW51OxzDEYbZ
	mGcKr4QmDpw8ljC+h9gKp74Ziique8R5gBqF4Ccd3D1jEmHTB4C3ISi3WMhqtgoh8p7iRkt7phf
	dPmFfyaBI+amCN8TFXiaxynS3LBXqTKwXEYtLYMtPDvgUv0aZQuwUgT0WPan/OZFbypg0fav1oo
	jRHYh+OF5J16dZK4c8RmYMKgTWkWnXjth4VMwnS0C8drOEFMNdoPcvRCgewza000dEswych9X4r
	+jNeqhRfK0Q2mu5KALOvf4wTSeVmZw5PaUobrqocoVA0mprftYhIVeBKUv48dgZGQYgH+iweIWr
	g4X4WPEx5u6EIcDc=
X-Received: by 2002:a05:622a:648:b0:527:73d6:f6f5 with SMTP id d75a77b69052e-52e09cec5bdmr164050611cf.41.1787560009517;
        Mon, 24 Aug 2026 01:26:49 -0700 (PDT)
X-Received: by 2002:a05:622a:648:b0:527:73d6:f6f5 with SMTP id d75a77b69052e-52e09cec5bdmr164050371cf.41.1787560009023;
        Mon, 24 Aug 2026 01:26:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496296cafsm1165175766b.14.2026.08.24.01.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:26:48 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:26:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Paul Hollinsky <phollinsky@holtechnik.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        regressions@lists.linux.dev
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Don't require PAS for memory
 protection
Message-ID: <bxljh7bwnpoes54yucll2wsflskiwbhy7w2u34lhreezpw5co7@chzok7jtx3dh>
References: <20260821081540.89137-1-phollinsky@holtechnik.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821081540.89137-1-phollinsky@holtechnik.com>
X-Proofpoint-GUID: eY5DRgW7TabCZLhS9I_UB3Y4dvhVRAxZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NCBTYWx0ZWRfX18mU1hjYTdT2
 5qZlTh70huxtl0MQdr3hPZTESJpJIq5IRCpH9o/+lDzH6Di3yGSgrHaHMjseqa3miaWHyBC/y6c
 5BzRK+z88hToDi6wAZRs/16nIncrdenT7lm071tOvm1A6vIH2fpJgoB/F5mjeGIlt+6jEaYEnA2
 HL95a4oreLaoC1rbBbpDEuWSkEQL8PITUzd91iquKPs5vzu/zUJqlc8uQ60rslBgr+tSkj3Izmb
 JlAIPpaiCg/+5zj8ZMFAcGNfKQdbvw66he+5bPF2TB0dbZ0y4yLscpG2iC4ZwKtrORqjoz9hPUb
 4jReCDapEWOKq8x8zHAqWmSP97BuzClh/a4VGAq0YnEadSP0x/VieVs3qka/WYtTDzhS3cOnw8b
 jihYra/Uqnp1fyU8bjSza/jMg2WV8ikxlzJo/LqWKaqEAqb+pElwVdsn3m+BXarLYxNlPWXbHOf
 OAwilct8BdT5RbZwgiw==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c004a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=8dbcrQVTAAAA:8 a=EUspDBNiAAAA:8 a=O9LFjDSsXfd6YXdYHBYA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=2958AbVqUNA9gn3SDOjC:22
X-Proofpoint-ORIG-GUID: eY5DRgW7TabCZLhS9I_UB3Y4dvhVRAxZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NCBTYWx0ZWRfX7TOi+2A83459
 9PdcGJX9y7KECBVhsu31krN5lKvwpnIL0DuRgkn5l+V4TAIs4pkMU6w+Qso/y0WNxpviG35mgW2
 2OfB2cx2VSuM2XdePmGZeK75uAoXiOs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240074

On 26-08-21 01:15:40, Paul Hollinsky wrote:
> Commit f3b1357673dd ("remoteproc: qcom_q6v5_mss: Switch to generic PAS
> TZ APIs") changed the probe-time gate for need_mem_protection platforms
> from qcom_scm_is_available() to qcom_pas_is_available(). Memory
> protection in this driver is implemented with qcom_scm_assign_mem(),
> which is a TZ service distinct from PAS. The only PAS call in the driver
> is qcom_pas_mem_setup(), and it is already guarded by need_pas_mem_setup.
> 
> No descriptor sets both flags: sc7180, sc7280, sdm660, sdm845, msm8996
> and msm8998 set need_mem_protection only, while msm8937, msm8940 and
> msm8953 set need_pas_mem_setup only. On TrustZone firmware that does not
> implement PAS - for example SC7180 Chromebooks, where call-availability
> queries report every QCOM_SCM_SVC_PIL command as unavailable - the modem
> consequently never probes:
> 
>   platform 4080000.remoteproc: deferred probe pending: (reason unknown)
> 
> On those machines the modem is also what loads the WLAN firmware, so
> ath10k never receives QMI and wifi does not come up either.
> 
> Gate memory protection on SCM availability as it was before, and require
> PAS only where a PAS call is actually issued. Keeping the SCM check
> matters: qcom_scm_assign_mem() passes __scm->mempool to
> qcom_tzmem_alloc() without testing __scm, so dropping the gate entirely
> would allow a NULL dereference when qcom_scm has not yet probed.
> 
> Fixes: f3b1357673dd ("remoteproc: qcom_q6v5_mss: Switch to generic PAS TZ APIs")
> Link: https://lore.kernel.org/r/20260808034716.58888-1-phollinsky@holtechnik.com
> Signed-off-by: Paul Hollinsky <phollinsky@holtechnik.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
