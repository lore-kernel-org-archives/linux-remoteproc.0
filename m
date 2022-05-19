Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F2C0C433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 19 May 2022 00:12:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbiESAMY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 May 2022 20:12:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231875AbiESAMU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 May 2022 20:12:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632996D955;
        Wed, 18 May 2022 17:12:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 15B1FB82263;
        Thu, 19 May 2022 00:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DE2C385A5;
        Thu, 19 May 2022 00:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652919134;
        bh=YDonGCHz2c+T5mdFPQ0Na/FKLrC5TiZsJnHeIvaUg7c=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=b7cXZlT7jJ73TVPd5iuVJbNqA3pJPJ+T27LwVPR2VrTy+ghSw2Cu9fcTXTA/IO0yS
         6KF096UxBPQvhakGzmoeBKZOFwfj0BO/Y9TbBPBKqVRJDbyUKjPzQoUBc2I+9HaR8W
         P64zHBKEy2LRjDRFNHeqGh3ocfpmp7fQ7V5CdYzt/jWllHVvpjnPYZZpFO3bTRdZuH
         It8kPJAER3XyhjRpYyVBbauRuoNcAqSIOGjCkmEZ8sznRyU058kEQ7iP292RjOziRS
         qdYXL1xf10ICyX9Tpan5s/q2pjwSoNPLkAbTzrvKzs/bkpFuJfrg9VastowMk5DNGh
         kT5haG4vQsFzw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220501103520.111561-7-krzysztof.kozlowski@linaro.org>
References: <20220501103520.111561-1-krzysztof.kozlowski@linaro.org> <20220501103520.111561-7-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 7/8] soc: qcom: cmd-db: replace strncpy() with strscpy_pad()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Date:   Wed, 18 May 2022 17:12:12 -0700
User-Agent: alot/0.10
Message-Id: <20220519001214.A7DE2C385A5@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Quoting Krzysztof Kozlowski (2022-05-01 03:35:19)
> The use of strncpy() is considered deprecated for NUL-terminated
> strings[1].  Replace strncpy() with strscpy_pad(), to keep existing
> pad-behavior of strncpy.  This fixes W=3D1 warning:
>=20
>   drivers/soc/qcom/cmd-db.c: In function =E2=80=98cmd_db_get_header.part.=
0=E2=80=99:
>   drivers/soc/qcom/cmd-db.c:151:9: warning: =E2=80=98strncpy=E2=80=99 spe=
cified bound 8 equals destination size [-Wstringop-truncation]
>     151 |         strncpy(query, id, sizeof(query));
>=20
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strncp=
y-on-nul-terminated-strings
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
