Return-Path: <Markus.Elfring@web.de>
Subject: Re: [PATCH 1/4] remoteproc: Fix a bug in rproc_alloc()
From: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <e459f807-4c61-257b-b7b5-dd767202c435@web.de>
Date: Tue, 14 Apr 2020 10:24:26 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
To: Mathieu Poirier <mathieu.poirier@linaro.org>, Alex Elder <elder@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

> I'm not actually sure this case causes an observable problem, but
> it's incorrect.  Fix this by initializing the notifyids field before
> calling ida_simple_get() in rproc_alloc().

I suggest to improve the commit message.

* Can the information =E2=80=9Cfield initialisation=E2=80=9D be more helpf=
ul than =E2=80=9Cbug=E2=80=9D
  in the patch subject?

* Will the tag =E2=80=9CFixes=E2=80=9D become relevant?

Regards,
Markus
