Return-Path: <bjorn.andersson@linaro.org>
Date: Fri, 26 May 2017 12:19:51 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RESEND: PATCH v4 1/4] firmware: scm: Add new SCM call for
 switching memory ownership
Message-ID: <20170526191951.GK12920@tuxbook>
References: <1494957722-13264-1-git-send-email-akdwived@codeaurora.org>
 <1494957722-13264-2-git-send-email-akdwived@codeaurora.org>
 <20170526060341.GG12920@tuxbook>
 <2206f468-769b-c743-29e9-6fe0a13086d2@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2206f468-769b-c743-29e9-6fe0a13086d2@codeaurora.org>
To: "Dwivedi, Avaneesh Kumar (avani)" <akdwived@codeaurora.org>
Cc: sboyd@codeaurora.org, agross@codeaurora.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 26 May 06:01 PDT 2017, Dwivedi, Avaneesh Kumar (avani) wrote:
> On 5/26/2017 11:33 AM, Bjorn Andersson wrote:
> > On Tue 16 May 11:01 PDT 2017, Avaneesh Kumar Dwivedi wrote:
[..]
> > > diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
[..]
> > > +#define QCOM_SCM_VMID_HLOS       0x3
> > > +#define QCOM_SCM_VMID_MSS_MSA    0xF
> > > +#define QCOM_SCM_PERM_READ       0x4
> > > +#define QCOM_SCM_PERM_WRITE      0x2
> > > +#define QCOM_SCM_PERM_EXEC       0x1
> > > +#define QCOM_SCM_PERM_RW (QCOM_SCM_PERM_READ | QCOM_SCM_PERM_WRITE)
> > Add QCOM_SCM_PERM_RWX, as this looks fairly common as well.
> You mean change name as QCOM_SCM_PERM_RWX instead of QCOM_SCM_PERM_RW ? OK.

Provide both RW and RWX, as already in the first client of this API
you're using both.

Thanks,
Bjorn
