Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B515CC433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 May 2022 19:07:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353158AbiETTHY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 May 2022 15:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353111AbiETTHX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 May 2022 15:07:23 -0400
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7F41195E89
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 May 2022 12:07:21 -0700 (PDT)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-d6e29fb3d7so11337509fac.7
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 May 2022 12:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=nihMNKg/Cee52sDZgIzDCYQdEGAz2qYL7OpwXO++SRk=;
        b=Xzzdw+qOUg6OXEC6WX8aZ1fXI2d76UtEKEll96yvfxKwyLcQKj/n4uMJDsdxKR8Kh3
         CLc9+NimGVuwpkzvs6o/El+Bo8J37wsXEpvP/XZxH5R59MsSoB+OL8ratu/uc9jTkxrQ
         MwJ5uD2OsRF/hjJ4TmXsFrBtfEkLd4GcmRSJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=nihMNKg/Cee52sDZgIzDCYQdEGAz2qYL7OpwXO++SRk=;
        b=uk68P6xUoZzPoMIZz8Sy+s/gqsixgBT/+FKXRAjQ40cUF6Vk9D1lceX5suPJjHTQwv
         uZL4frqz5ecPU+PHI79vinIFxX+4XSokN00IuD204D69rfKDDOm6HFUkZ0NApicKGNIS
         oTqUEJKoCaS2plXIyAvGbnPngC6RqBC1ZIaZWbO+3utPUSCQJc+Tzg4NemyWVYgYg9td
         kmNC3SDHqfU8uQ6h+n6Gt4esZ2b2/R9VMBmEwVdzG2jcDo/FnBYNJyJvL1xQS/FPOp3+
         tRIfou1aXI/rPfF4XLMN84lkQKbgRpYXhLhirgA0b+kMpInkUew8yMxYgwkmi8XzpCAW
         CG6w==
X-Gm-Message-State: AOAM532Ztci11uFf0tUXyfLLhbK7Y8tCtQRhM7Zn8W8rLLBRZXQw19M1
        QuKUPZHnwT663AUZrOiNMUwqVzu2/klfSNcqkSuNvw==
X-Google-Smtp-Source: ABdhPJxIC9bDA4i/ZggEJB0rWG96ePG3EUgyO1b8ubjEfLF0xE6tjuSnzDqSm6ZyeHYmPQkHU+YybI/U0OJccJHUwV8=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr6170490oap.193.1653073641117; Fri, 20
 May 2022 12:07:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 20 May 2022 12:07:20 -0700
MIME-Version: 1.0
In-Reply-To: <031ebead-4b0d-8493-d8f8-96f2ff9d938a@quicinc.com>
References: <1652978825-5304-1-git-send-email-quic_sibis@quicinc.com>
 <1652978825-5304-2-git-send-email-quic_sibis@quicinc.com> <YoaqDcB6wkd4zOWR@ripper>
 <031ebead-4b0d-8493-d8f8-96f2ff9d938a@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Fri, 20 May 2022 12:07:20 -0700
Message-ID: <CAE-0n53hDDoetQW0Bz7noq4peuNCyrGsXaJdjFj=4sMkGeZFgw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] arm64: dts: qcom: sc7280: Add proxy interconnect
 requirements for modem
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <quic_sibis@quicinc.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mka@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Sibi Sankar (2022-05-20 11:08:52)
> Hey Bjorn,
> Thanks for taking time to review the series.
>
> On 5/20/22 2:05 AM, Bjorn Andersson wrote:
> > On Thu 19 May 09:47 PDT 2022, Sibi Sankar wrote:
> >
> >> Add interconnects that are required to be proxy voted upon during modem
> >> bootup on SC7280 SoCs.
> >
> > This looks reasonable, but how come the vote is only for DDR frequency?
> > What about the buses between modem and ddr?
>
> The proxy votes that are put in aren't for perf related reasons, the
> modem was getting llcc timeouts while trying to read contents from
> memory. The hw team recommended the proxy votes as the fix.

Presumably the bootloader sets up some initial modem and ddr bus
bandwidth requests? Or the modem bootloader stage (MSA?) handles that
part?
