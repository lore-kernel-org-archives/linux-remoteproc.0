Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A67483806
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 07:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964558; cv=none; b=tEKHqcb21mvp2xsOH6o355GGDMBU8V/I8ClfXHjakrVXtf1aUFsmjAv1/AMNWpqMmEZ8LJQA73r/pvD/HtrRSyhjVJW5XhCkkLr+B4BIDH+1AtVsSiImuqKnLzre7AUgj8aF9abFNxrDjoOFZyrtPLFiNHyHOjjWWtHbv9GuMFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964558; c=relaxed/simple;
	bh=zKPIcvOng6sOoWT5GIAeoysX7DOIQXuoTK9dJ/h0xXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnxbaJTKLGT9UN5kmXbN8CZB3HyRzpBwVBuHMdxDfgfRyg/Gxi23Fj740LDZXH43cNfk1CyWvWacFJYYyvl1k1HzENzKdssb7SZXCWMiLPmQ9YFvRFw9kSCy+wpA8UcMnEUaB4opUHiWise+L9sZ3lGv/5WDvK/QSrmU6/VbOW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PHs4u3Ep; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMQ6ns6J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PHs4u3Ep";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMQ6ns6J"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E663H83365336
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 07:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bwcuSGY118ee4NtPshCbzgah
	LOs36WmQjPRzBW+ykeg=; b=PHs4u3EpwD2o5FmrXfWp9HYocPJHSZz0vyHlZESP
	Ktse98DmzNlcGuoCykVY4H5PAQQqYJ2mk0DNEzoxeWk2qSB0YZuj5zxVTmXkfjfr
	iCdKk1ZZmsNeSq0XfHgJ5Qq1Yb8YRmN7BNo0yBmrO1x/o5i2gnX8/3pc5cfdURRP
	B2Vj5uSs+5bMBw7eag/+lFS+wkBShxgOXUVrzkCYZugDNA4ZiQkipS/6NT7CZlnd
	0eTt4hyVhXBhiWWEm7uJ4zAkL8FXWWVqh2WyHnwifPrn0xzh8eNsPEgHfTUvcnhp
	XRpf8LXXMHNzUvKagydjtfwWYA7/LcUm4vSPgUrWW51k1Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4620e7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 07:55:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab9850456aso167934a91.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Oct 2026 00:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791964555; x=1792569355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bwcuSGY118ee4NtPshCbzgahLOs36WmQjPRzBW+ykeg=;
        b=GMQ6ns6J9/0UzWseEFANV1pnU16qnArUXlDTan4jzEM2g7TQNF0v3E6YHvrlcqOSAF
         M/AKWhb1OZZmnz8dqm6o09/pxR51MV9fW/NtfhOPF+aZqzGKSi0EtMSfNn9DC5d0LuYi
         htM8LeGYaFLYHYVrdxaqy4vnD40ztibwH7YXgr1ocsHEBvxs1qVO2oPdtRL0mWEI6aqO
         +q8cBfbzJjbFqkCcXONnsrg7f3z1qzNK05ZoHKQPwHpykJIhK9K+JmugWZ2HglBVP579
         PBhRLFzPMYVFMFa4sYSsIx570hw/zhJMab9R5VTEr8zBGk+lrUayuvp2PP5//k9VMjM8
         JBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791964555; x=1792569355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwcuSGY118ee4NtPshCbzgahLOs36WmQjPRzBW+ykeg=;
        b=PcsaA8obTQLDJMg53qdEDruAvl860W/tTRGP/aJBaAcxkj4HBHiI5Kl4CYwnuWiMj6
         aNlyEKNmVe04kGMb2CCJRtUzvcQfMrKFjcDTFH8zAan+XiVy6+KClv4wyIK65s9canOH
         12Czvbl3d7QdeJHa+a79gl7588ffBkrNwSFC9KwirUvYZuHb4+e17WOE1FOBjvOFlxJm
         eXV8Z9c8leR1UDdFjW8jAqWAQ0PIvwE4qFE2hFmqkVmCrY5pGyDjk4IRJvyc6x48Wcr4
         WqtpL7g2rsinXZTZDMiSTiLVTLOGwoah/3PFOBcbxwJ0mfHeHE2kIQuGYL40r7cl0hSl
         GmdQ==
X-Forwarded-Encrypted: i=1; AKwUvBxh5Zwt9DdxfwXzbsL6GiDpjGZ/iiC/6SP43uRtOoB+wSozBA5eZ5tlBX7llTe+hwHGyTvMf7NvlnmZ1jef5wlS@vger.kernel.org
X-Gm-Message-State: AFq9FYI8dYulH2Ij4b34GpRb73p6ieL94MmBtFxdQENfxOOcLYDsgxy4
	gOi9L+9g8S1mNgckKHoGlMkmUrTs59Dv5Gfmeoltm+4YmaeaviCBLEXOKtMSGw1eG6X4NYJf6l+
	bnrRW2jGxeDmxJBPksgiopI9n1iPExzpsiAo76lKUMsX4I2b196e7upaPrTVSpJr6LgGXD5UB
X-Gm-Gg: AYBFou05SdB8hRO48A8eZxgGAmKaVwLAI+x5XfSSuTt4FERmDIKj0Mn4vnVw0G7vyQ5
	phhh/q8Y3991qOpx7nkDodQezGgEIz+afOjSn35CSrnohZnGu+umK7s8oxlqFY+YgbXICIGyM3Q
	1bw9upF8SwMwlKxdbPJYLM7UFHP30aigwHjZgIjwvWn2W1NiFn5m7er7niT05jrBMqwhPNpCAH6
	/0I7FrI2kgCucXM9OxYteGjYpxLLhO2Il+jdrELJ6w5FbXg67GEm0AtvDQ+NAaX6R9wOn9noj5R
	WXF/P/htYhlW/1zoOWLmD5cYK/Lr6xZwhVSdr7wzOW9LIPyhAvKUwbigX66jLLPA+0VuBGvTJi6
	/mDq8K3jpVsCVXFaRJAYU4WK7aUSRX6Vpw6w77B5xJA==
X-Received: by 2002:a17:90a:c2cc:b0:3aa:ee83:6f2b with SMTP id 98e67ed59e1d1-3ab3a955970mr13203629a91.13.1791964555019;
        Wed, 14 Oct 2026 00:55:55 -0700 (PDT)
X-Received: by 2002:a17:90a:c2cc:b0:3aa:ee83:6f2b with SMTP id 98e67ed59e1d1-3ab3a955970mr13203609a91.13.1791964554428;
        Wed, 14 Oct 2026 00:55:54 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f2ba9efsm3255828a91.16.2026.10.14.00.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:55:54 -0700 (PDT)
Date: Wed, 14 Oct 2026 15:55:48 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] remoteproc: qcom: pas: Decide early_boot attach
 at probe time
Message-ID: <as81hN8Af7CKCYtl@QCOM-aGQu4IUr3Y>
References: <20261014070038.564879-1-shengchao.guo@oss.qualcomm.com>
 <20261014070038.564879-2-shengchao.guo@oss.qualcomm.com>
 <as8zq_GMu1pkoMYA@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as8zq_GMu1pkoMYA@linaro.org>
X-Proofpoint-ORIG-GUID: s6pdg4YUUOaNa2bGaWRkjAvgVmhbuKdW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMSBTYWx0ZWRfX1XlD/ocBXUKm
 mLPSDJm1OR/GrpIPjuGbHMwzBqORMgXzw20FQIJsPy/1tOF+vugnDOxcQmmowf4IR8FCMLMngdT
 DrPDDqnUfjsK5M/chVUWhfuaeZ5ePZPZ7N+K9djHJuBnZ+oQUte8ikC5N99F5sxAoCH/QwnYDkl
 Us9Rwoxco6MryfTBiIOYDViHVgB/anLqhG/j+AItTBKQ4Z7HFfypIVoDBVThXs33LEHwuitrONM
 VmPgz1/XSZfaenDjsWD4UzQc4PwpyMgIWOD2UzEH5JNf0ZFJeSKuckN4Y8/EDaldLGUd9EKe1rO
 iX9xPRoYRAkVt1gcD7VfrOotuE97fa6bMU8z/j/ImmGFAzfbJPUZRaVXKwmyVBlgjBHiUy/ALNS
 E2o4YoLwelQBuxceMdFC5hYrZFe7yo/OlAYrIy6aXhWZy7u/YTnKESGEExZ7goSNVS6l6iBEJ/F
 Vr//ouu5uqGl2bVIp9A==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf358c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-9aZd_Kv_hcnAOLhCNgA:9
 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMSBTYWx0ZWRfX9+7R+EcFv6hN
 3GqfJ5bTXtWCNvA8oARmbrLUz199BmkYPeI783kECOQZrKSsTLxKjmKIYrvPWSpmG4o4jNnDdI/
 xfGcw45DSA+GCGKyi7ezGllT0KuocVE=
X-Proofpoint-GUID: s6pdg4YUUOaNa2bGaWRkjAvgVmhbuKdW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140031

On Wed, Oct 14, 2026 at 09:47:55AM +0200, Stephan Gerhold wrote:
> On Wed, Oct 14, 2026 at 03:00:37PM +0800, Shawn Guo wrote:
> > For early_boot subsystems, probe unconditionally marks the rproc
> > RPROC_DETACHED and qcom_pas_attach() discovers from SMP2P whether the
> > bootloader actually started the remote. If it did not, attach sets the
> > state back to RPROC_OFFLINE and fails, expecting the core to boot the
> > firmware instead. The core does not do that: rproc_boot() treats the
> > attach failure as fatal and the remote is never started.
> > 
> > This is hit on Nord with firmware where XBL no longer brings ADSP out
> > of reset. The remote never publishes its inbound SMP2P entries, so the
> > very first state read fails (debug print below) and the ADSP stays down:
> > 
> >   qcom_q6v5_pas 4c00000.remoteproc: Failed to get fatal_irq state: -19
> >   remoteproc remoteproc0: can't attach to rproc adsp: -19
> > 
> > The ready, stop-ack and sysmon shutdown-ack signals cannot change while
> > Linux has not yet interacted with the remote, so there is no reason to
> > defer the decision to attach time. Check them in probe and only mark
> > the rproc RPROC_DETACHED when the remote is up and has not been asked
> > to stop; otherwise leave it RPROC_OFFLINE so the regular firmware boot
> > path is taken. The ready state is read first so that a missing SMP2P
> > entry -ENODEV is treated as "not running" before sysmon is queried.
> > 
> > qcom_pas_attach() keeps only the fatal check, since that is the one
> > signal that has to be acted upon once the rproc is attached.
> > 
> > Assisted-by: LLM
> > Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> > Fixes: 16472c99f469 ("remoteproc: qcom: pas: Add late attach support for subsystems")
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Cc: stable@vger.kernel.org
> 
> is still missing. Would be good to have these fixes backported, since
> the original change landed in 7.3. If you used b4 trailers -u and it
> didn't add the Cc tag after my message that would confirm my suspicion
> that b4 won't pick up that tag. :/

Oops! I should have added the tag myself.

> Bjorn might forget to add these, so it's likely easiest and most
> reliable if you resend again with the tag added in both patches.

Yes, will do.

Shawn
