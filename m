Return-Path: <s-anna@ti.com>
Subject: Re: [PATCH] dt-binding: remoteproc: Document generic properties
References: <1470850622-29816-1-git-send-email-bjorn.andersson@linaro.org>
 <20160812183448.GA32059@rob-hp-laptop> <20160812224223.GJ26240@tuxbot>
 <46d4d351-336c-6d4f-b1b0-243cf3c5d68b@ti.com>
 <20160908165032.GA9526@rob-hp-laptop>
From: Suman Anna <s-anna@ti.com>
Message-ID: <dfa838cf-15f6-c178-f69a-1b5488f74a7a@ti.com>
Date: Thu, 8 Sep 2016 13:32:17 -0500
MIME-Version: 1.0
In-Reply-To: <20160908165032.GA9526@rob-hp-laptop>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Ohad Ben-Cohen <ohad@wizery.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Rob,

On 09/08/2016 11:50 AM, Rob Herring wrote:
> On Fri, Sep 02, 2016 at 04:45:45PM -0500, Suman Anna wrote:
>> On 08/12/2016 05:42 PM, Bjorn Andersson wrote:
>>> On Fri 12 Aug 11:34 PDT 2016, Rob Herring wrote:
>>>
>>>> On Wed, Aug 10, 2016 at 10:37:02AM -0700, Bjorn Andersson wrote:
>>>>> This documents the generic properties "rprocs" and "rproc-names", used
>>>>> for consumer drivers to reference a remoteproc node.
>>>>
>>>> How do you intend to use this? I wonder if it would not be better to 
>>>> expose a remote proc with existing bindings for a particular purpose 
>>>> (e.g. clocks, resets, etc.) rather than a generic connection. The client 
>>>> side would have to have specific knowledge as to what functions the 
>>>> remote proc provides.
>>>>
>>>
>>> The remoteproc node represents the mechanism and resources needed to
>>> control the life cycle a co-processor, e.g. loading, booting, shutting
>>> gown a video encoder/decoder.
>>>
>>> The proposed reference allows a separate thingie to assert control of
>>> the life cycle of that co-processor.
>>>
>>>
>>> I acknowledge that in some cases there is a fine line between what is
>>> the life cycle management and what is the actual functionality
>>> implemented by that remote processor. But as the remoteproc mechanism is
>>> reusable between various use cases I think it makes sense to not describe
>>> them as one unit.
>>
>> What's the current state of this patch, not officially acked yet right?
> 
> Bjorn and I have discussed some, but probably needs more discussion. 
> This binding alone is simple enough, but I want to understand better how 
> it will be used and digesting all the QCom h/w is not simple.

OK, thanks. The binding has no bearing on Qcom h/w though.

> 
>> While we are at this, can we agree upon an alias stem name as well, we
>> can stick to "rproc". Otherwise, I can submit an incremental patch on
>> top of this along with the code that adds an API to retrieve it for
>> client users.
> 
> Any alias for this will be NAKed. My position on aliases is well 
> documented.

Hmm, I don't have the complete background/history on your stance. I do
have a need for identifying an exact remoteproc instance. How do you
propose I do that without aliases, and without adding a non-hw related
property to the DTS node? Like for example, we have 8 identical DSPs on
Keystone 2 Hawking SoCs, and I need to construct a firmware name based
on the instance id, and I cannot do this based on probe order.

regards
Suman
