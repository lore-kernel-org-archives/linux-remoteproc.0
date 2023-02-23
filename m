Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0585C636D6
	for <linux-remoteproc@archiver.kernel.org>; Thu, 23 Feb 2023 12:38:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233792AbjBWMiv (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 23 Feb 2023 07:38:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233303AbjBWMiu (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 23 Feb 2023 07:38:50 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E7DB744
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Feb 2023 04:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677155876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=o5faige4boHy1KDnDJFUMGzlyi7Wgdd7JL40G0EvBo0=;
        b=DAd69z/mYzo+WhTe+QrdMa5w37mfk94GO5CzaCRSOEbhF+nhiqNXPbPhC/TArBDxe5+B9+
        liEk1vMkKXZ/PdYUSmxQYw0OoYAvhg33TEnNA7VnKGnwqpzN2PcPOSVg+edfytRdxDJTkD
        bSzjTpjE7EMvgAL9ZDqsoUIkwDr3Q1o=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-17-ZnsHTeDROuWYZFkuX2WFNg-1; Thu, 23 Feb 2023 07:37:55 -0500
X-MC-Unique: ZnsHTeDROuWYZFkuX2WFNg-1
Received: by mail-io1-f70.google.com with SMTP id a21-20020a5d9595000000b0074c9dc19e16so1557458ioo.15
        for <linux-remoteproc@vger.kernel.org>; Thu, 23 Feb 2023 04:37:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o5faige4boHy1KDnDJFUMGzlyi7Wgdd7JL40G0EvBo0=;
        b=QCvFYLqsb7/pta0We65u+wTLdxyx0b50xhx+l1dbqNYIKlOflRxs3jK8iK7l4AeHR5
         VFEs5AAvM3p3g0J80N52d9Jdn5A/FSLWyNkwwLXktuNeIniyn4l8AMA4zy6Tp0TTEbth
         YfglhqjdbfokbuGbDCWpAHdmGVcNzBKJ/vBbpSAlomBIkVeEZo9lF0doqva3MECiD+3k
         1ce8Pxj75VRRWmla9Us+khTg0AqdxOH5iNLYZ8WANMQSscpjNK2DZdg1I1q9EXy8HZ+G
         Do5GEMsDdE5PQ+fKvfUYT4Z5i0IrikDlmcJKokwEQFlGpv8kapXz+X7lbGGeBH1Dspc/
         Nhgw==
X-Gm-Message-State: AO0yUKXL6SUlI8o+KSuyxLVjive+bV3T2WiJ+4EAECkLp9T0rtrAgtPo
        Ou9zLybK8awonWqyacusW3gFsE9kY9Steh1xPOel7U7kxIqwZw4dYPGWNJr+k8e6YD01ntDkMXE
        pAJ1Y1o0MggTW7xBWG9t0KZ9NBpcoTg==
X-Received: by 2002:a05:6e02:1445:b0:316:e54a:828f with SMTP id p5-20020a056e02144500b00316e54a828fmr6493866ilo.6.1677155874524;
        Thu, 23 Feb 2023 04:37:54 -0800 (PST)
X-Google-Smtp-Source: AK7set/6AWA4CAuXGZNmzPhHzcrBdzMdBpWOTtYJucrF1Qv97MIIPEiFDxaTnG32VB1VQ2w0xUjrzA==
X-Received: by 2002:a05:6e02:1445:b0:316:e54a:828f with SMTP id p5-20020a056e02144500b00316e54a828fmr6493856ilo.6.1677155874289;
        Thu, 23 Feb 2023 04:37:54 -0800 (PST)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id y22-20020a02bb16000000b0039e89ea68f9sm1759062jan.135.2023.02.23.04.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 04:37:53 -0800 (PST)
Date:   Thu, 23 Feb 2023 07:37:51 -0500
From:   Brian Masney <bmasney@redhat.com>
To:     Mukesh Ojha <quic_mojha@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 0/6] Add basic Minidump kernel driver support
Message-ID: <Y/deHzijzvuvCJ2M@x1>
References: <1676978713-7394-1-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1676978713-7394-1-git-send-email-quic_mojha@quicinc.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Feb 21, 2023 at 04:55:07PM +0530, Mukesh Ojha wrote:
> Minidump is a best effort mechanism to collect useful and predefined data
> for first level of debugging on end user devices running on Qualcomm SoCs.
> It is built on the premise that System on Chip (SoC) or subsystem part of
> SoC crashes, due to a range of hardware and software bugs. Hence, the
> ability to collect accurate data is only a best-effort. The data collected
> could be invalid or corrupted, data collection itself could fail, and so on.
> 
> Qualcomm devices in engineering mode provides a mechanism for generating
> full system ramdumps for post mortem debugging. But in some cases it's
> however not feasible to capture the entire content of RAM. The minidump
> mechanism provides the means for selecting which snippets should be
> included in the ramdump.
> 
> The core of minidump feature is part of Qualcomm's boot firmware code.
> It initializes shared memory (SMEM), which is a part of DDR and
> allocates a small section of SMEM to minidump table i.e also called
> global table of content (G-ToC). Each subsystem (APSS, ADSP, ...) has
> their own table of segments to be included in the minidump and all get
> their reference from G-ToC. Each segment/region has some details like
> name, physical address and it's size etc. and it could be anywhere
> scattered in the DDR.
> 
> Existing upstream Qualcomm remoteproc driver[1] already supports minidump
> feature for remoteproc instances like ADSP, MODEM, ... where predefined
> selective segments of subsystem region can be dumped as part of
> coredump collection which generates smaller size artifacts compared to
> complete coredump of subsystem on crash.
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/remoteproc/qcom_common.c#n142
> 
> In addition to managing and querying the APSS minidump description,
> the Linux driver maintains a ELF header in a segment. This segment
> gets updated with section/program header whenever a new entry gets
> registered.

I'd like to test this series plus your series that sets the multiple
download modes. Can you include documentation about how to actually use
this new feature? Also the information that you provided above is really
useful. I think that should also go in the documentation file as well.

I already have a reliable way to make a board go BOOM and go into
ramdump mode.

Brian

